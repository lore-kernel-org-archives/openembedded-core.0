Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC2AE6AC43
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 02:07:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2Q27ROV014020
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Mar 2015 19:07:27 -0700 (PDT)
Received: from tal.localnet (128.224.21.104) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Mar 2015 19:07:26 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Mar 2015 22:07:25 -0400
Message-ID: <7421816.fQdbn0xUHR@tal>
Organization: Wind River 
User-Agent: KMail/4.13.3 (Linux/3.13.0-45-generic; KDE/4.13.3; x86_64; ; )
In-Reply-To: <2276651.XvdEfp8ivO@tal>
References: <1427300914-11208-1-git-send-email-mark.asselstine@windriver.com>
	<CAJTo0LbqKtrxavRkmi=hxQAPGvGPzrwK-AJGnqDybSHup_puZw@mail.gmail.com>
	<2276651.XvdEfp8ivO@tal>
MIME-Version: 1.0
Cc: Christopher Larson <clarson@kergoth.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: add a vardeps for configure on libdir
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
X-List-Received-Date: Thu, 26 Mar 2015 02:07:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On March 25, 2015 20:37:51 Mark Asselstine wrote:
> On March 25, 2015 20:44:57 Burton, Ross wrote:
> > On 25 March 2015 at 16:28, Mark Asselstine <mark.asselstine@windriver.com>
> > 
> > wrote:
> > > For target builds libdir is not something that changes and for -native
> > > builds unless you move your builds around you will see no issue with
> > > the current implementation. If you do update libdir or if you move
> > > your build or reuse sstate by copying it to a new build you will start
> > > to see errors. These will be seen when you use the 'openssl' tool and
> > > look like the following:
> > > 
> > > WARNING: can't open config file: /home/build/bitbake_build/tmp/
> > > 
> > >                         sysroots/x86_64-linux/usr/lib/ssl/openssl.cnf
> > 
> > We don't generally require that native sstate is rebuilt when the build
> > directory changes, as otherwise you wouldn't be able to share native
> > sstate
> > between builds and users.  Instead, paths are munged where possible when
> > using sstate and wrapper scripts used to "fix" binaries.  Indeed
> > openssl.inc does this:
> > 
> > do_install_append_virtclass-native() {
> > 
> >         create_wrapper ${D}${bindir}/openssl \
> >         
> >             OPENSSL_CONF=${libdir}/ssl/openssl.cnf \
> >             SSL_CERT_DIR=${libdir}/ssl/certs \
> >             SSL_CERT_FILE=${libdir}/ssl/cert.pem \
> >             OPENSSL_ENGINES=${libdir}/ssl/engines
> > 
> > }
> > 
> > Is it possible that the binary isn't respecting the OPENSSL_CONF
> > environment variable since that wrapper was written? (or the wrapper
> > wasn't
> > tested well enough)
> 
> Interesting. Thanks for the heads up Ross I can definitely look at the
> wrapper for possible issues.

Ross,

This is exactly the clue I needed. With this I was able to determine the flaw 
in my analysis. Things are working as expected, my patch is not needed.

Sorry for the noise. Thanks Ross and Christopher for the guidance,
Mark

> 
> Mark
> 
> > Ross


