Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8525462135
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 02:00:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1G20DvH020786
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 15 Feb 2016 18:00:13 -0800
Received: from [128.224.162.139] (128.224.162.139) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 15 Feb 2016 18:00:12 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1455522477-32256-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0Lb5CtPQtRcOF0Bg6sd883Ah_SKFPL2Mimc82-OiyaKuLg@mail.gmail.com>
From: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <56C282AA.9010707@windriver.com>
Date: Tue, 16 Feb 2016 10:00:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb5CtPQtRcOF0Bg6sd883Ah_SKFPL2Mimc82-OiyaKuLg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-serialgetty: fix a typo
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
X-List-Received-Date: Tue, 16 Feb 2016 02:00:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年02月15日 18:30, Burton, Ross wrote:
>
> On 15 February 2016 at 07:47, <rongqing.li@windriver.com
> <mailto:rongqing.li@windriver.com>> wrote:
>
>     -SERIAL_CONSOLE ?= "115200 ttyS0"
>     +SERIAL_CONSOLES ?= "115200 ttyS0"
>
>
> bitbake.conf says:
>
> SERIAL_CONSOLES ??= "${@d.getVar('SERIAL_CONSOLE', True).replace(' ', ';')}"
>
> And the relevant commit introducing _CONSOLES says:
>
>      Just define additional serial consoles like so:
>      SERIAL_CONSOLES="115200;ttyS0 115200;ttyS1 ... 115200;ttySN"
>
> So moving from CONSOLE to CONSOLES is more than just adding an S.

sorry, I am wrong

>
> Anyway, surely the machine should be setting this if required?  Why does
> systemd-serialgetty think that ttyS0 should be a serial console if the
> machine doesn't say so?
>

This is a issue, like qemux86, ttyS0 and ttyS1 will be used as console,
but ttyS1 is not a true device when execute "runqemu qemux86", and lead
to the blow error.


root@qemu0:~# systemctl status serial-getty@ttyS1
● serial-getty@ttyS1.service - Serial Getty on ttyS1
    Loaded: loaded (/lib/systemd/system/serial-getty@.service; enabled; 
vendor preset: enabled)
    Active: active (running) since Sat 2016-02-06 03:33:26 UTC; 1s ago
      Docs: man:agetty(8)
            man:systemd-getty-generator(8)
            http://0pointer.de/blog/projects/serial-console.html
  Main PID: 902 (agetty)
    CGroup: 
/system.slice/system-serial\x2dgetty.slice/serial-getty@ttyS1.service
            └─902 /sbin/agetty -8 -L --keep-baud ttyS1 115200 xterm

Feb 06 03:33:26 qemu0 systemd[1]: Started Serial Getty on ttyS1.
Feb 06 03:33:26 qemu0 agetty[902]: /dev/ttyS1: not a tty




the below commit sets ttyS1 as console, but runqemu has only ttyS0 device.


commit 2da3fee6b6d9f4dd4c4cb529f4ba393c20aa0f13
Author: Randy Witt <randy.e.witt@linux.intel.com>
Date:   Thu Aug 20 13:01:25 2015 -0700

     qemurunner: Use two serial ports and log console with a thread

     qemu can freeze and stop responding if the socket buffer connected 
to a tcp
     serial connection fills up. This happens of course when the reader of
     the serial data doesn't actually read it.

     This happened in the qemurunner code, because after checking for the
     "login:" sentinel, data was never again read from the serial 
connection.

     This patch solves the potential freeze by adding a thread to 
continuously
     read the data from the console and log it. So it also will give a 
full log
     of the console, rather than just up to the login prompt.

     To simplify this patch, another serial port was also added to use 
for the
     sole purpose of watching for the sentinel as well as being the 
interactive
     serial port. This will also prevent the possibility of lots of debug
     data on the console preventing the sentinel value from being seen 
due to
     interleaved text.

     Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
     Signed-off-by: Ross Burton <ross.burton@intel.com>






-Roy




> Ross
-- 
Best Reagrds,
Roy | RongQing Li

