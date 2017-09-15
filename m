Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F2E6077EA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 22:55:25 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8FMtKJE021747
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 15 Sep 2017 23:55:22 +0100
Message-ID: <1505516120.18640.108.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Seebs <seebs@seebs.net>, Ross Burton <ross.burton@intel.com>
Date: Fri, 15 Sep 2017 23:55:20 +0100
In-Reply-To: <20170915125815.29a4a6e3@seebsdell>
References: <20170915115848.4939-1-ross.burton@intel.com>
	<20170915125815.29a4a6e3@seebsdell>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] useradd: don't override pseudo environment
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
X-List-Received-Date: Fri, 15 Sep 2017 22:55:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-09-15 at 12:58 -0500, Seebs wrote:
> On Fri, 15 Sep 2017 12:58:48 +0100
> Ross Burton <ross.burton@intel.com> wrote:
> 
> > 
> > Remove the PSEUDO_LOCALSTATEDIR assignment and inherit the correct
> > assignment in FAKEROOTENV.
> Nice catch! This probably explains a LOT of the strange behaviors
> we've been seeing.

I think it will fix some warnings but I believe the bulk of the issues
are from files being deleted in contents outside of pseudo and then the
inode numbers being reused.

Note that this issue existed long before we had recipe specific
sysroots.

Unfortunately its very hard to guarantee we'll always delete files
under pseudo context as for example "do_clean",
"do_recipe_prepare_sysroot" and others are not pseudo tasks but can
add/delete files. Files in ${WORKDIR}/temp such as log files and
sysroot manifests and locks may be modified by both the fakeroot worker
and the parent bitbake server too.

Possible options:

a) Add a way to filter the paths pseudo looks at and cares about.
b) At server startup, check files really do exist
c) Add some way to trigger a sync of the pseudo db with what is on 
   disk.

Cheers,

Richard

