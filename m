Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 50F0073CBD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 23:31:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 01 Jun 2016 16:31:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,403,1459839600"; d="scan'208";a="993386815"
Received: from krawden-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.85])
	by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2016 16:31:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Date: Thu, 02 Jun 2016 11:31:21 +1200
Message-ID: <3646067.LvorxU5kj3@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.9-300.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1464645472.19134.107.camel@linuxfoundation.org>
References: <20160527102831.24166-1-otavio@ossystems.com.br>
	<1464645472.19134.107.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ca-certificates: Add openssl as a runtime dependency
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
X-List-Received-Date: Wed, 01 Jun 2016 23:31:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mon, 30 May 2016 22:57:52 Richard Purdie wrote:
> On Fri, 2016-05-27 at 07:28 -0300, Otavio Salvador wrote:
> > The update-ca-certificates script uses the c_rehash utility which is
> > installed by openssl. Add openssl as a runtime dependency to fulfill
> > the utility requirement.
> > 
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> > 
> >  meta/recipes-support/ca-certificates/ca-certificates_20160104.bb | 2
> > 
> > ++
> > 
> >  1 file changed, 2 insertions(+)
> 
> This broke allarch machine signature invariance however I merged a
> patch to resolve that.

I think we may still be missing a build-time dependency for
ca-certificates-native:

--------------------- snip ---------------------
ERROR: ca-certificates-native-20160104-r0 do_install: Function failed: do_install (log file is located at /home/paul/poky/poky/build/tmp/work/x86_64-linux/ca-certificates-native/20160104-r0/temp/log.do_install.16841)
ERROR: Logfile of failure stored in: /home/paul/poky/poky/build/tmp/work/x86_64-linux/ca-certificates-native/20160104-r0/temp/log.do_install.16841
Log data follows:
| DEBUG: Executing shell function do_install
| NOTE: make -j 8 CERTSDIR=/home/paul/poky/poky/build/tmp/sysroots/x86_64-linux/usr/share/ca-certificates SBINDIR=/home/paul/poky/poky/build/tmp/sysroots/x86_64-linux/usr/sbin DESTDIR=/home/paul/poky/poky/build/tmp/work/x86_64-linux/ca-certificates-native/20160104-r0/image install
| for dir in mozilla; do \
|   mkdir /home/paul/poky/poky/build/tmp/work/x86_64-linux/ca-certificates-native/20160104-r0/image//home/paul/poky/poky/build/tmp/sysroots/x86_64-linux/usr/share/ca-certificates/$dir; \
|   make -C $dir install CERTSDIR=/home/paul/poky/poky/build/tmp/work/x86_64-linux/ca-certificates-native/20160104-r0/image//home/paul/poky/poky/build/tmp/sysroots/x86_64-linux/usr/share/ca-certificates/$dir; \
| done
| make[1]: Entering directory '/home/paul/poky/poky/build/tmp/work/x86_64-linux/ca-certificates-native/20160104-r0/git/mozilla'
| for p in *.crt; do \
|  install -m 644 $p /home/paul/poky/poky/build/tmp/work/x86_64-linux/ca-certificates-native/20160104-r0/image//home/paul/poky/poky/build/tmp/sysroots/x86_64-linux/usr/share/ca-certificates/mozilla/$p ; \
| done
| make[1]: Leaving directory '/home/paul/poky/poky/build/tmp/work/x86_64-linux/ca-certificates-native/20160104-r0/git/mozilla'
| for dir in sbin; do \
|   make -C $dir install CERTSDIR=/home/paul/poky/poky/build/tmp/work/x86_64-linux/ca-certificates-native/20160104-r0/image//home/paul/poky/poky/build/tmp/sysroots/x86_64-linux/usr/share/ca-certificates/$dir; \
| done
| make[1]: Entering directory '/home/paul/poky/poky/build/tmp/work/x86_64-linux/ca-certificates-native/20160104-r0/git/sbin'
| install -d /home/paul/poky/poky/build/tmp/work/x86_64-linux/ca-certificates-native/20160104-r0/image/home/paul/poky/poky/build/tmp/sysroots/x86_64-linux/usr/sbin
| install -m755 update-ca-certificates /home/paul/poky/poky/build/tmp/work/x86_64-linux/ca-certificates-native/20160104-r0/image/home/paul/poky/poky/build/tmp/sysroots/x86_64-linux/usr/sbin/
| make[1]: Leaving directory '/home/paul/poky/poky/build/tmp/work/x86_64-linux/ca-certificates-native/20160104-r0/git/sbin'
| Updating certificates in /home/paul/poky/poky/build/tmp/work/x86_64-linux/ca-certificates-native/20160104-r0/image/home/paul/poky/poky/build/tmp/sysroots/x86_64-linux/etc/ssl/certs...
| /home/paul/poky/poky/build/tmp/work/x86_64-linux/ca-certificates-native/20160104-r0/image/home/paul/poky/poky/build/tmp/sysroots/x86_64-linux/usr/sbin/update-ca-certificates: line 210: c_rehash: command not found
| WARNING: /home/paul/poky/poky/build/tmp/work/x86_64-linux/ca-certificates-native/20160104-r0/temp/run.do_install.16841:1 exit 127 from 'SYSROOT="/home/paul/poky/poky/build/tmp/work/x86_64-linux/ca-certificates-native/20160104-r0/image/home/paul/poky/poky/build/tmp/sysroots/x86_64-linux" /home/paul/poky/poky/build/tmp/work/x86_64-linux/ca-certificates-native/20160104-r0/image/home/paul/poky/poky/build/tmp/sysroots/x86_64-linux/usr/sbin/update-ca-certificates'
| ERROR: Function failed: do_install (log file is located at /home/paul/poky/poky/build/tmp/work/x86_64-linux/ca-certificates-native/20160104-r0/temp/log.do_install.16841)
ERROR: Task 1070 (virtual:native:/home/paul/poky/poky/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb, do_install) failed with exit code '1'
--------------------- snip ---------------------

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

