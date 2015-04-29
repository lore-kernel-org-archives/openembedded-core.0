Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C6EAE7169F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 08:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3T8xo7g019227; Wed, 29 Apr 2015 09:59:50 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UrlRs1ZyYhWh; Wed, 29 Apr 2015 09:59:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3T8xbR2019195
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 29 Apr 2015 09:59:48 +0100
Message-ID: <1430297977.19130.5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Wed, 29 Apr 2015 09:59:37 +0100
In-Reply-To: <1574592.uPXveHVxj5@peggleto-mobl.ger.corp.intel.com>
References: <cover.1430294879.git.Qi.Chen@windriver.com>
	<9798a8311486c433ae323a8c5d7fef53ce07d380.1430294879.git.Qi.Chen@windriver.com>
	<1574592.uPXveHVxj5@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] populate_sdk_ext: consider custom configuration in local.conf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Apr 2015 08:59:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-04-29 at 09:54 +0100, Paul Eggleton wrote:
> Hi Qi,
> 
> On Wednesday 29 April 2015 16:08:36 Chen Qi wrote:
> > Copy the contents of local.conf under TOPDIR into the final generated
> > local.conf. In this way, custom settings are also made into the final
> > local.conf like IMAGE_INSTALL, DISTRO_FEATURES, VIRTUAL-RUNTIME_xxx, etc.
> > 
> > Before this change, installing extensible SDK would usually report failure
> > when preparing the build system if the user has custom configuration for
> > DISTRO_FEATURES in local.conf. Also, items in IMAGE_INSTALL_append in
> > local.conf also don't get built correctly.
> > 
> > This patch solves the above problem.
> > 
> > A blacklist mechanism is also introduced so that we can blacklist variables
> > that should not be copied into the final local.conf file. Currently, the
> > blacklist contains 'SSTATE_DIR' and 'DL_DIR'.
> > 
> > [YOCTO #7616]
> > 
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  meta/classes/populate_sdk_ext.bbclass | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/meta/classes/populate_sdk_ext.bbclass
> > b/meta/classes/populate_sdk_ext.bbclass index dc2c58e..7925ece 100644
> > --- a/meta/classes/populate_sdk_ext.bbclass
> > +++ b/meta/classes/populate_sdk_ext.bbclass
> > @@ -16,6 +16,7 @@ SDK_RDEPENDS_append_task-populate-sdk-ext = "
> > ${SDK_TARGETS}" SDK_RELOCATE_AFTER_INSTALL_task-populate-sdk-ext = "0"
> > 
> >  SDK_META_CONF_WHITELIST ?= "MACHINE DISTRO PACKAGE_CLASSES"
> > +SDK_META_CONF_BLACKLIST ?= "DL_DIR SSTATE_DIR"
> 
> I'm not totally opposed to this approach but we are going to have to get the 
> default list right if we are going to do it - e.g. you've missed the fairly 
> obvious TMPDIR. There are quite a large number of other variables the user 
> might set that should be blacklisted - potentially any variable that points to 
> a location where the build system would write files (DEPLOY_DIR, DEPLOY_DIR_*, 
> WORKDIR, T, S, B, ...). We might go a step further and use the data dictionary 
> to check if the value evaluates to somewhere outside of ${TMPDIR} (if we first 
> make a copy of d and set TMPDIR to a dummy value); this way we would allow 
> adjustments within TMPDIR but not outside of it.
> 
> My other concern (perhaps a pet issue of mine) is that people are far too 
> reliant on putting things in local.conf that they really shouldn't. On the 
> other hand building a potentially broken SDK or at least one that doesn't 
> match up with the image is worse, but I'm still concerned about the way 
> local.conf is often abused.

One thing we could do programatically is to build the bash config hash
with and without local.conf. If they match, local.conf isn't influencing
the build checksums. If they don't match, local.conf has something
problematic in it and we could error and tell the user to fix it?

This would also cover site.conf, auto.conf and the other conf files we
can detect.

Cheers,

Richard


