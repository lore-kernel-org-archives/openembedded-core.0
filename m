Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T5kMi-0005Jc-RV for openembedded-core@lists.openembedded.org;
	Sun, 26 Aug 2012 23:27:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7QLFHFt009031;
	Sun, 26 Aug 2012 22:15:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03432-06; Sun, 26 Aug 2012 22:15:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7QLF7dF009025
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sun, 26 Aug 2012 22:15:09 +0100
Message-ID: <1346015710.7252.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 26 Aug 2012 22:15:10 +0100
In-Reply-To: <cover.1345084532.git.liezhi.yang@windriver.com>
References: <cover.1345084532.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/2 V3] scripts/bitbake-whatchanged: print what is about to happen
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Aug 2012 21:27:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-08-16 at 14:46 +0800, Robert Yang wrote:
> Changes of V3:
> * Move it from bitbake/bin/ to oe-core/scripts
> 
> * Change BB_STAMPS_DIR to STAMPS_DIR
> 
> * Use "which bitbake-diffsigs" to locate where is the bitbake/lib/bb since it
>   needs bb.siggen.compare_sigfiles (must) and bb.process.run (optional).
> 
> Changes of V2:
> * Fix a typo fn -> 'fn'
> 
> * Use "bitbake -e" rather than "bitbake -e recipe" to get the BB_STAMPS_DIR
> 
> * Use "BB_STAMPS_DIR=<path> bitbake -S recipe" to regenerate the stamps
> 
> * Change the summary format a little, now it looks like:
>   - (without -v):
>     === Summary: (3653 changed, 1927 unchanged)
>     Newly added: 807
>     PV changed: 48
>     PR changed: 276
>     Depends changed: 2522
> 
>   - (with -v):
>     === Summary: (3653 changed, 1927 unchanged)
>     Newly added: 807
>     Depends changed: 2846
> 
> Changes of V1:
>   Initial version

I tried this:

$ MACHINE=qemux86 bitbake-whatchanged nativesdk-perl
Figuring out the STAMPS_DIR ...
Generating the new stamps ... (need several minutes)
ERROR occurred!
Traceback (most recent call last):
  File "/media/build1/poky/scripts/bitbake-whatchanged", line 342, in <module>
    sys.exit(main())
  File "/media/build1/poky/scripts/bitbake-whatchanged", line 303, in main
    old_recon = recon_dict(old_dict)
  File "/media/build1/poky/scripts/bitbake-whatchanged", line 96, in recon_dict
    if os.stat(full_path_pre).st_mtime > os.stat(full_path_cur).st_mtime:
OSError: [Errno 2] No such file or directory: '/media/build1/poky/build/tmp/stamps/armv7a-vfp-neon-poky-linux-gnueabi/bash-4.2-r4.do_compile.sigdata.80ff8a0bb7180f101517f35e8cf4ba8b'


and it looks like the environment isn't preserved since this is
defaulting to beagleboard which is what is in my local.conf, not the
MACHINE=qemux86 I expected.

Cheers,

Richard




