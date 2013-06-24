Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BEE626ABBB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 07:45:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5O7j98Y003735
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Jun 2013 00:45:09 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 24 Jun 2013 00:45:08 -0700
Message-ID: <51C7F903.9030809@windriver.com>
Date: Mon, 24 Jun 2013 15:45:07 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>
References: <cover.1371807568.git.jackie.huang@windriver.com>
	<d520d4fc66725801e83d4719e6c71f9015d8c9b0.1371807568.git.jackie.huang@windriver.com>
	<CANyK_8desSo69SzZqb4PNL1WHDV1EgrCGegGTYse8zwTN_iymw@mail.gmail.com>
In-Reply-To: <CANyK_8desSo69SzZqb4PNL1WHDV1EgrCGegGTYse8zwTN_iymw@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Limit the kbdrate application to x86, mips and sparc.
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
X-List-Received-Date: Mon, 24 Jun 2013 07:45:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 6/24/2013 3:23 PM, Paul Barker wrote:
> On 24 Jun 2013 07:28, <jackie.huang@windriver.com
> <mailto:jackie.huang@windriver.com>> wrote:
>  >
>  > From: Jackie Huang <jackie.huang@windriver.com
> <mailto:jackie.huang@windriver.com>>
>  >
>  > The code relies on hardware specific memory locations to access
>  > and modify the keyboard repeat rate.  It also requires read/write
>  > access to /dev/port which doesn't exist on every architecture's
>  > root fs.  The defect was raised for Qemu PowerPC but it also fails on
>  > ARM.  The keyboard emulation in qemuppc is for an ADB (Apple Desktop Bus)
>  > device and not compatible with an Intel driver.  There's also no
>  > indication in the documentation that the code should work on
>  > anything other than Intel architecture but it also works on MIPS.
>  >
>
>  > ++#if !(  defined(__i386__)   \
>  > ++     || defined(__x86_64__) \
>  > ++     || defined(__mips__)   \
>  > ++     || defined(__sparc___))
>  > ++
>  > ++      fprintf(stderr,
>  > ++              "ERROR:  %s should only be used on MIPS, x86 and
> Sparc archicture boards\n", basename(argv[0]));
>  > ++        exit(1);
>  > ++#endif
>
> Would it be better to detect the target platform in the build system and
> skip building the kbdrate program for architectures it won't work on
> rather than building and installing a known broken program?

Yeah, it should be better, I will check if we can do that.

>
>  > ++      set_progname(argv[0]);
>  > +       set_progname(argv[0]);
>
> Accidental repeat?

Indeed, thanks for pointing this out.

Thanks,
Jackie

>
> --
>
> Paul Barker
>
> Email: paul@paulbarker.me.uk <mailto:paul@paulbarker.me.uk>
> http://www.paulbarker.me.uk
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

