Return-Path: <kamensky@cisco.com>
X-Greylist: delayed 425 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 29 Feb 2020 08:02:27 UTC
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
	by mail.openembedded.org (Postfix) with ESMTP id 3282A618F0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 08:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=30225; q=dns/txt;
	s=iport; t=1582963349; x=1584172949;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:mime-version;
	bh=AQgcQ8aqW1QoBP7MlwuUB50HSJNZ+0oKH+Pi5VawvGc=;
	b=Zg0CD6qewfnhtc7q2NJrFqyndXIUb7v11+JAo42aTZgA0bLT88ifUBGY
	SrIacJfpZ8rF16LGU579py11ID4Jvkcr1yz0DS/zW2WsQFZzjEQyqhQjz
	iMB22KGhPEJd+BwclMF5ygEYl2afjMmEmuiVcAFKHwNRfkFbGEQVxN1U7 c=;
X-Files: 0001-make-disable-use-of-posix_spawn-on-mips.patch : 1586
IronPort-PHdr: =?us-ascii?q?9a23=3A8zFi7RUOyGbENaEzXEYNqRcygcDV8LGuZFwc94?=
	=?us-ascii?q?YnhrRSc6+q45XlOgnF6O5wiEPSA9yJ8OpK3uzRta2oGXcN55qMqjgjSNRNTF?=
	=?us-ascii?q?dE7KdehAk8GIiAAEz/IuTtank5FcFPUkRm7lmwMFNeH4D1YFiB6nA=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CBAADAF1pe/4oNJK1mGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQEBAQEBEQEBAQEBAQEBAQEBgXuBVCQsBWxYIAQLKodaA4pmgXZpgQG?=
	=?us-ascii?q?XFIFCgRADUAQCBwEBAQwBARgLCgIEAQGEQAKCCiQ4EwIDAQELAQEFAQEBAgE?=
	=?us-ascii?q?FBG2FVgyFYwEBAQEDAREIDRkBATcBDwIBCBEDAQEBARYYAiYKHQgCBAENBQg?=
	=?us-ascii?q?GFIMFgkoDLgEOowgCgTmIYoF0M4J/AQEFgS8BAwIMQ4MJGIIFBwmBOIwlGoI?=
	=?us-ascii?q?AgRABR4IYNT6CZAECAQGBLQERAgEiFQkGDAwKDYJugiyNWwsKiGWBCQ6BNpZ?=
	=?us-ascii?q?9CoI8g3CDYYkzhX2CSX+LbYt8jnCIfJJMAgQCBAUCDgEBBYFpImdxcBWDJwl?=
	=?us-ascii?q?HGA2OAhsMARaBQYIPhRSFQXQCgSeMF4IyAQE?=
X-IronPort-AV: E=Sophos;i="5.70,499,1574121600"; 
	d="scan'208,223";a="644344532"
Received: from alln-core-5.cisco.com ([173.36.13.138])
	by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	29 Feb 2020 07:55:22 +0000
Received: from XCH-ALN-004.cisco.com (xch-aln-004.cisco.com [173.36.7.14])
	by alln-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 01T7tMrc000443
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Sat, 29 Feb 2020 07:55:22 GMT
Received: from xhs-rcd-001.cisco.com (173.37.227.246) by XCH-ALN-004.cisco.com
	(173.36.7.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Sat, 29 Feb 2020 01:55:21 -0600
Received: from xhs-rcd-003.cisco.com (173.37.227.248) by xhs-rcd-001.cisco.com
	(173.37.227.246) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Sat, 29 Feb 2020 01:55:20 -0600
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (72.163.14.9) by
	xhs-rcd-003.cisco.com (173.37.227.248) with Microsoft SMTP Server
	(TLS) id
	15.0.1473.3 via Frontend Transport; Sat, 29 Feb 2020 01:55:20 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=FfjVNRmoH8Xcr+c28z42udrDHrodM20mkxSZgSUqrU135E+oayYT4z2H/2WTGe8qO4LMHhYv6BDGMKtEMlDlM9WTPE8FauojWDZpXmbhUXn+lqCQwm+UVB+9x/UmIR3pNxV5PjFuBSHlWH+cLGOUFJK0rPoC0S9rnFXds/UhubxXtaMfV0WEgCR04hTnGkYWu/TC8AJMRpVOb8XfqofOp40nbq9b5afTEDBDcLqkqN8UJ9JWK+L7P7uAsL+EPIf1idZiagjjFCqPXGd6FZnKFSPyvN3pqxtF4yDR1EVKRBgKCYoxMtVJ6jU3bzkQK5dO/Dm5EBe4oT5yPXo5mNmpNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/EJpnCAgUg1cHYAloy3OFCOlATHHECaAtHb1clvqqZY=;
	b=ByQFTq2wU1QnXyEdNkAq73DOB9A3YB3SxHsD37wVknv5p52xCg8n550KXLI2ZAJoyOgTvRvpcFtCkjmeDBjEU5mf9b7fiD3ieU/oaErkujGzVnGFiVDsv0Gdl45/vQ21nItsDwKF6+Txl5UbVklY5Qx4AF3yWUB5kTIAjRdbOjvWE2moAkODVNRD6r9r5PbJNvUghpDy5NMFkkhqU14SQVAnB/fK5WuFZsUsIto7P4rw4S8RbxuOR+TcZkDJS+8afLk7qOH3Jel2iK66cmLbD9ntf75ao0Scpv2twoMBz0tRkHijB4Ip/HAWg1ynJehScSerdhHKqbcewTMDi+uTcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com; 
	dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com; 
	s=selector2-cisco-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/EJpnCAgUg1cHYAloy3OFCOlATHHECaAtHb1clvqqZY=;
	b=sOTp3IDcmmNtLYuaE/kyJCNjJ5+5rpjOFHKkc34AiTqMlWiCWP+TJcloE12FBhWK1zdfNLm0ihxnxbkWnNjKZ1RFgw95oZ5tjg+hcgYftf1X+kzuMdDrQxxmkyG4aCdcPIJ5cvKXmvHEiVxTD7CCge99wIgaUNdfx5zzyU3sR+k=
Received: from BL0PR11MB3219.namprd11.prod.outlook.com (2603:10b6:208:61::23)
	by BL0PR11MB2948.namprd11.prod.outlook.com (2603:10b6:208:75::30)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.16;
	Sat, 29 Feb 2020 07:55:18 +0000
Received: from BL0PR11MB3219.namprd11.prod.outlook.com
	([fe80::f4ee:122a:9daf:1783]) by
	BL0PR11MB3219.namprd11.prod.outlook.com
	([fe80::f4ee:122a:9daf:1783%7]) with mapi id 15.20.2772.018;
	Sat, 29 Feb 2020 07:55:18 +0000
From: "Victor Kamensky (kamensky)" <kamensky@cisco.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Jens Rehsack
	<sno@netbsd.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3] make: 4.2.1 -> 4.3
Thread-Index: AQHV6yBGAZbNl89kvU2/iCwkILRQNagwP/aAgAGNZaw=
Date: Sat, 29 Feb 2020 07:55:17 +0000
Message-ID: <BL0PR11MB3219D87CD091E6BC103A79F3CDE90@BL0PR11MB3219.namprd11.prod.outlook.com>
References: <20200224143920.19383-1-sno@netbsd.org>,
	<3bdcf798302bbb0ce1de37eca82223dd8c3778e3.camel@linuxfoundation.org>
In-Reply-To: <3bdcf798302bbb0ce1de37eca82223dd8c3778e3.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=kamensky@cisco.com; 
x-originating-ip: [2001:420:c0c8:1003::116]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4aae6857-a6c9-490f-1cb4-08d7bcecb7eb
x-ms-traffictypediagnostic: BL0PR11MB2948:
x-microsoft-antispam-prvs: <BL0PR11MB29485D307C3C52A0BBA7F14ECDE90@BL0PR11MB2948.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 03283976A6
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(199004)(189003)(8936002)(8676002)(81166006)(81156014)(30864003)(55016002)(7696005)(9686003)(110136005)(316002)(71200400001)(6506007)(86362001)(53546011)(186003)(478600001)(4326008)(66476007)(2906002)(64756008)(66556008)(66616009)(5660300002)(66946007)(966005)(76116006)(66446008)(52536014)(33656002)(579004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR11MB2948;
	H:BL0PR11MB3219.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cisco.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bLcY4zVSHWTJtnS/KnlPp8nWX/pHO6B7OYampKqJ2kfJpnz9joR4jBNYIVXZuhn0gLi6jcWkldhD2Xqvyzw1WWvfiy6gm1yPbeR14R8bFZodbyCQsEHMNRO8Ajuwack0f3OvghMUzIGk9e1uLmVHcoquxThgzRmCYjpQBMkjOy9TrT7CsqxMd6rZiGnGlTMCeyGVKifuuNPjNfvf0O7odeqTgIvKO6limadLnLFtIRexFluV5NGuNKeI39H4S1TGopW4r37n9c02LJGTClyLjSKPm8+hy59tXMOYSu7n+pOEsWFp6zaRTz8hV1/MWyVY+n1kTK5eC5FpzjdNezAx8XaMLj8Xmz8TZkf78lyfwJtC4kkls7fH+eLHugWFknrcaq5lWVQIurBWLlxJNZzQE3lQVpgNMBFCM38iwrqUGqxp3XeUmvXcCc0eygZvUgx32+JqItYGmdAP4Lx+cRRP5HX/wSXNd4HCe2RSJUQK1Zz48N2Ad/fxpX825x/UiZnWNVxNvJ5GEDPXwiAeLWzaqA==
x-ms-exchange-antispam-messagedata: DS7H0CQUMCRRqgjFDX6XKJmjYuezvuduUQC2dZDDJyMtEZHaKeBRC924Ck+pjXZcgadWk8NdTCD9aQCW53bOAwSRUvX4Lnmg4W0uK8XjkNFqYjil+YkeNui0iKA0KA9ML3BzfIQygVcLC6eTWTWpiqzPE2SlSCqnsxm4F0yKq7U=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aae6857-a6c9-490f-1cb4-08d7bcecb7eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2020 07:55:17.8997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TAp+svKNWcYKhSUA5sZGWwG7xJg4l0xH/HS2AaRkp46PpUhuRBJAi2wjHB5xX0GL/Z4hSHaUHZu2PWmrT5nBsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2948
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.14, xch-aln-004.cisco.com
X-Outbound-Node: alln-core-5.cisco.com
Subject: Re: [PATCH v3] make: 4.2.1 -> 4.3
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
X-List-Received-Date: Sat, 29 Feb 2020 08:02:28 -0000
X-Groupsio-MsgNum: 135833
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_BL0PR11MB3219D87CD091E6BC103A79F3CDE90BL0PR11MB3219namp_"

--_002_BL0PR11MB3219D87CD091E6BC103A79F3CDE90BL0PR11MB3219namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[sorry for the top post: bad email client at work]=0A=
=0A=
Hi Richard, Jens,=0A=
=0A=
I was able to reproduce and debugged the mips new make issue. Workaround=0A=
patch attached.=0A=
=0A=
In summary: kernelmodule.KernelModuleTest.test_kernel_module=0A=
fails with 'fatal error: opening dependency file scripts/basic/.fixdep.d: P=
ermission denied'=0A=
=0A=
New make-4.3 started using posix_spawn glibc call,=0A=
that happens to be broken on mips. On mips during posix_spawn call=0A=
__spawni_child function that is executed after clone makes=0A=
setresuid call with spurious/wrong value of ruid. Instead of -1=0A=
it passes 127, effectively switching real user id since test=0A=
runs under root. Subsequent gcc runs under wrong ruid and it=0A=
fails to write into /usr/src/kernel/scripts/basic directory.=0A=
=0A=
__spawni_child uses direct system call invocation for setresuid=0A=
rather calling glibc function. And there is wrong code generation=0A=
issue somewhere in inline assembly for direct system call and/or=0A=
way how compiler processes it. I did not dig into it yet, it=0A=
looks as quite hard problem and needs more time.=0A=
=0A=
For now I've made workaround patch that just through configure=0A=
ac_cv_func_posix_spawn=3Dno parameter tells make configure not to use=0A=
posix_spawn on mips.=0A=
=0A=
I will also send suggested patch through 'git send-mail'=0A=
=0A=
Tested workaround on qemumips64, did not have time for=0A=
qemumips full test, verified build only and made sure that=0A=
posix_spawn is not used. But I believe it is the same issue.=0A=
=0A=
Detailed debugging notes=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=
Running 'bitbake core-image-sato-sdk -c testimage' fails on qemumips64=0A=
----------------------------------------------------------------------=0A=
=0A=
RESULTS - kernelmodule.KernelModuleTest.test_kernel_module: FAILED (36.71s)=
=0A=
=0A=
Reproducing issue manually=0A=
--------------------------=0A=
=0A=
root@qemumips64:~# cd /usr/src/kernel && make scripts prepare=0A=
  HOSTCC  scripts/basic/fixdep=0A=
scripts/basic/fixdep.c:410:1: fatal error: opening dependency file scripts/=
basic/.fixdep.d: Permission denied=0A=
  410 | }=0A=
      | ^=0A=
compilation terminated.=0A=
make[2]: *** [scripts/Makefile.host:107: scripts/basic/fixdep] Error 1=0A=
make[1]: *** [Makefile:500: scripts_basic] Error 2=0A=
make: *** [Makefile:678: include/config/auto.conf.cmd] Error 2=0A=
make: *** [include/config/auto.conf.cmd] Deleting file 'include/config/tris=
tate.conf'=0A=
root@qemumips64:/usr/src/kernel# ls -al scripts/basic/.fixdep.d=0A=
ls: cannot access 'scripts/basic/.fixdep.d': No such file or directory=0A=
=0A=
Calling the same gcc command manually from shell=0A=
------------------------------------------------=0A=
=0A=
It works, no problem.=0A=
=0A=
root@qemumips64:/usr/src/kernel# gcc -Wp,-MD,scripts/basic/.fixdep.d -Wall =
-Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=3Dgn=
u89 -o scripts/basic/fixdep scripts/basic/fixdep.c=0A=
root@qemumips64:/usr/src/kernel# =0A=
=0A=
Means make changes context in such way that prevents gcc=0A=
command execution.=0A=
=0A=
Looking at strace result=0A=
------------------------=0A=
=0A=
Run the same make command under strace. In log see that=0A=
getuid return 127! I.e it is different user. It does not=0A=
have permission to write into scripts/basic/.fixdep.d=0A=
=0A=
1144  getuid()                          =3D 127=0A=
1144  getgid()                          =3D 127=0A=
=0A=
and earlier:=0A=
=0A=
1144  getuid()                          =3D 0=0A=
1144  setresuid(127, 0, -1)             =3D 0=0A=
1144  getgid()                          =3D 0=0A=
1144  setresgid(127, 0, -1)             =3D 0=0A=
1144  dup2(6, 1)                        =3D 1=0A=
1144  rt_sigprocmask(SIG_SETMASK, [], NULL, 16) =3D 0=0A=
1144  execve("/bin/sh", ["/bin/sh", "-c", "uname -m | sed -e s/i.86/x86/ -e=
"...], 0xfffbb2e1d0 /* 16 vars */ <unfinished ...>=0A=
=0A=
There is call to setresuid that sets real user id to=0A=
127. Why?=0A=
=0A=
Running make under gdb=0A=
----------------------=0A=
=0A=
(gdb) set args scripts=0A=
(gdb) b main=0A=
Breakpoint 1 at 0x9d80: file ../make-4.3/src/main.c, line 1056.=0A=
(gdb) set follow-fork-mode child=0A=
(gdb) run=0A=
Starting program: /usr/bin/make scripts=0A=
=0A=
Breakpoint 1, main (argc=3D2, argv=3D0xffffffac78, envp=3D0xffffffac90) at =
../make-4.3/src/main.c:1056=0A=
1056	../make-4.3/src/main.c: No such file or directory.=0A=
(gdb) b getuid=0A=
Breakpoint 2 at 0xfff7eb5a00: file ../sysdeps/unix/syscall-template.S, line=
 59.=0A=
(gdb) b setresuid=0A=
Breakpoint 3 at 0xfff7eb5eb0: file ../sysdeps/unix/sysv/linux/setresuid.c, =
line 29.=0A=
(gdb) b execve=0A=
Breakpoint 4 at 0xfff7eb4f10: file ../sysdeps/unix/syscall-template.S, line=
 78.=0A=
(gdb) b clone=0A=
Breakpoint 5 at 0xfff7ef3c90: file ../sysdeps/unix/sysv/linux/mips/clone.S,=
 line 45.=0A=
(gdb) b posix_spawn =0A=
Breakpoint 6 at 0xfff7edd790: posix_spawn. (2 locations)=0A=
(gdb) b __spawni_child=0A=
Breakpoint 7 at 0xfff7eddac0: file ../sysdeps/unix/sysv/linux/spawni.c, lin=
e 123.=0A=
(gdb) c=0A=
Continuing.=0A=
=0A=
Breakpoint 2, getuid () at ../sysdeps/unix/syscall-template.S:59=0A=
59	../sysdeps/unix/syscall-template.S: No such file or directory.=0A=
(gdb) bt=0A=
#0  getuid () at ../sysdeps/unix/syscall-template.S:59=0A=
#1  0x000000fff7edfa7c in __euidaccess (path=3D0xaaaab21b30 "/bin/sh", mode=
=3D1) at ../sysdeps/posix/euidaccess.c:159=0A=
#2  0x000000aaaaadecdc in find_in_given_path (progname=3D0xaaaab25440 "/bin=
/sh", path=3D<optimized out>, optimize_for_exec=3D<optimized out>)=0A=
    at ../../make-4.3/lib/findprog-in.c:137=0A=
#3  0x000000aaaaac7680 in child_execute_job (child=3D0xffffff8770, good_std=
in=3D<optimized out>, argv=3D0xaaaab26cb0) at ../make-4.3/src/job.c:2384=0A=
#4  0x000000aaaaac2678 in func_shell_base (o=3D0xaaaab1e350 "", argv=3D<opt=
imized out>, trim_newlines=3D<optimized out>) at ../make-4.3/src/function.c=
:1790=0A=
#5  0x000000aaaaac2c38 in handle_function (op=3D0xffffff8930, stringp=3D<op=
timized out>) at ../make-4.3/src/function.c:2544=0A=
#6  0x000000aaaaabaa10 in variable_expand_string (line=3D<optimized out>, s=
tring=3D<optimized out>, length=3D<optimized out>) at ../make-4.3/src/expan=
d.c:262=0A=
#7  0x000000aaaaabb5b4 in allocated_variable_expand_for_file (line=3D<optim=
ized out>, file=3D<optimized out>) at ../make-4.3/src/expand.c:566=0A=
#8  0x000000aaaaadc11c in do_variable_definition (flocp=3D0xffffff8d70, var=
name=3D0xaaaab1fca0 "SUBARCH", =0A=
    value=3D0xaaaab24e6b "$(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64=
/x86/ -e s/sun4u/sparc64/ -e s/arm.*/arm/ -e s/sa110/arm/ -e s/s390x/s390/ =
-e s/parisc64/parisc/ -e s/ppc.*/powerpc/ -e s/mips.*/mips/ -e s/sh[234].*/=
s"..., origin=3D<optimized out>, flavor=3D<optimized out>, target_var=3D<op=
timized out>) at ../make-4.3/src/variable.c:1187=0A=
#9  0x000000aaaaadccac in try_variable_definition (flocp=3D0xffffff8d70, li=
ne=3D<optimized out>, origin=3D<optimized out>, target_var=3D<optimized out=
>)=0A=
    at ../make-4.3/src/variable.c:1633=0A=
#10 0x000000aaaaad2dfc in eval (ebuf=3D<optimized out>, set_default=3D<opti=
mized out>) at ../make-4.3/src/read.c:750=0A=
#11 0x000000aaaaad451c in eval_makefile (filename=3D<optimized out>, flags=
=3D<optimized out>) at ../make-4.3/src/read.c:436=0A=
#12 0x000000aaaaad3cc4 in eval (ebuf=3D<optimized out>, set_default=3D<opti=
mized out>) at ../make-4.3/src/read.c:908=0A=
#13 0x000000aaaaad451c in eval_makefile (filename=3D<optimized out>, flags=
=3D<optimized out>) at ../make-4.3/src/read.c:436=0A=
#14 0x000000aaaaad4a70 in read_all_makefiles (makefiles=3D<optimized out>) =
at ../make-4.3/src/read.c:258=0A=
#15 0x000000aaaaab4f9c in main (argc=3D<optimized out>, argv=3D<optimized o=
ut>, envp=3D<optimized out>) at ../make-4.3/src/main.c:1945=0A=
(gdb) c=0A=
Continuing.=0A=
=0A=
Breakpoint 6, __GI___posix_spawn (pid=3D0xffffff84b4, path=3D0xaaaab25440 "=
/bin/sh", file_actions=3D0xffffff84b8, attrp=3D0xffffff8588, argv=3D0xaaaab=
26cb0, envp=3D0xffffffac90)=0A=
    at spawn.c:30=0A=
30	spawn.c: No such file or directory.=0A=
(gdb) bt=0A=
#0  __GI___posix_spawn (pid=3D0xffffff84b4, path=3D0xaaaab25440 "/bin/sh", =
file_actions=3D0xffffff84b8, attrp=3D0xffffff8588, argv=3D0xaaaab26cb0, env=
p=3D0xffffffac90) at spawn.c:30=0A=
#1  0x000000aaaaac76b0 in child_execute_job (child=3D0xffffff8770, good_std=
in=3D<optimized out>, argv=3D0xaaaab26cb0) at ../make-4.3/src/job.c:2396=0A=
#2  0x000000aaaaac2678 in func_shell_base (o=3D0xaaaab1e350 "", argv=3D<opt=
imized out>, trim_newlines=3D<optimized out>) at ../make-4.3/src/function.c=
:1790=0A=
#3  0x000000aaaaac2c38 in handle_function (op=3D0xffffff8930, stringp=3D<op=
timized out>) at ../make-4.3/src/function.c:2544=0A=
#4  0x000000aaaaabaa10 in variable_expand_string (line=3D<optimized out>, s=
tring=3D<optimized out>, length=3D<optimized out>) at ../make-4.3/src/expan=
d.c:262=0A=
#5  0x000000aaaaabb5b4 in allocated_variable_expand_for_file (line=3D<optim=
ized out>, file=3D<optimized out>) at ../make-4.3/src/expand.c:566=0A=
#6  0x000000aaaaadc11c in do_variable_definition (flocp=3D0xffffff8d70, var=
name=3D0xaaaab1fca0 "SUBARCH", =0A=
    value=3D0xaaaab24e6b "$(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64=
/x86/ -e s/sun4u/sparc64/ -e s/arm.*/arm/ -e s/sa110/arm/ -e s/s390x/s390/ =
-e s/parisc64/parisc/ -e s/ppc.*/powerpc/ -e s/mips.*/mips/ -e s/sh[234].*/=
s"..., origin=3D<optimized out>, flavor=3D<optimized out>, target_var=3D<op=
timized out>) at ../make-4.3/src/variable.c:1187=0A=
#7  0x000000aaaaadccac in try_variable_definition (flocp=3D0xffffff8d70, li=
ne=3D<optimized out>, origin=3D<optimized out>, target_var=3D<optimized out=
>)=0A=
    at ../make-4.3/src/variable.c:1633=0A=
#8  0x000000aaaaad2dfc in eval (ebuf=3D<optimized out>, set_default=3D<opti=
mized out>) at ../make-4.3/src/read.c:750=0A=
#9  0x000000aaaaad451c in eval_makefile (filename=3D<optimized out>, flags=
=3D<optimized out>) at ../make-4.3/src/read.c:436=0A=
#10 0x000000aaaaad3cc4 in eval (ebuf=3D<optimized out>, set_default=3D<opti=
mized out>) at ../make-4.3/src/read.c:908=0A=
#11 0x000000aaaaad451c in eval_makefile (filename=3D<optimized out>, flags=
=3D<optimized out>) at ../make-4.3/src/read.c:436=0A=
#12 0x000000aaaaad4a70 in read_all_makefiles (makefiles=3D<optimized out>) =
at ../make-4.3/src/read.c:258=0A=
#13 0x000000aaaaab4f9c in main (argc=3D<optimized out>, argv=3D<optimized o=
ut>, envp=3D<optimized out>) at ../make-4.3/src/main.c:1945=0A=
(gdb) c=0A=
Continuing.=0A=
=0A=
Breakpoint 5, clone () at ../sysdeps/unix/sysv/linux/mips/clone.S:45=0A=
45	../sysdeps/unix/sysv/linux/mips/clone.S: No such file or directory.=0A=
(gdb) bt=0A=
#0  clone () at ../sysdeps/unix/sysv/linux/mips/clone.S:45=0A=
#1  0x000000fff7edd938 in __spawnix (pid=3D0xffffff84b4, file=3D0xaaaab2544=
0 "/bin/sh", file_actions=3D<optimized out>, attrp=3D<optimized out>, argv=
=3D0xaaaab26cb0, =0A=
    envp=3D0xffffffac90, xflags=3D<optimized out>, exec=3D0xfff7eb4f10 <exe=
cve>) at ../sysdeps/unix/sysv/linux/spawni.c:382=0A=
#2  0x000000aaaaac76b0 in child_execute_job (child=3D0xffffff8770, good_std=
in=3D<optimized out>, argv=3D0xaaaab26cb0) at ../make-4.3/src/job.c:2396=0A=
#3  0x000000aaaaac2678 in func_shell_base (o=3D0xaaaab1e350 "", argv=3D<opt=
imized out>, trim_newlines=3D<optimized out>) at ../make-4.3/src/function.c=
:1790=0A=
#4  0x000000aaaaac2c38 in handle_function (op=3D0xffffff8930, stringp=3D<op=
timized out>) at ../make-4.3/src/function.c:2544=0A=
#5  0x000000aaaaabaa10 in variable_expand_string (line=3D<optimized out>, s=
tring=3D<optimized out>, length=3D<optimized out>) at ../make-4.3/src/expan=
d.c:262=0A=
#6  0x000000aaaaabb5b4 in allocated_variable_expand_for_file (line=3D<optim=
ized out>, file=3D<optimized out>) at ../make-4.3/src/expand.c:566=0A=
#7  0x000000aaaaadc11c in do_variable_definition (flocp=3D0xffffff8d70, var=
name=3D0xaaaab1fca0 "SUBARCH", =0A=
    value=3D0xaaaab24e6b "$(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64=
/x86/ -e s/sun4u/sparc64/ -e s/arm.*/arm/ -e s/sa110/arm/ -e s/s390x/s390/ =
-e s/parisc64/parisc/ -e s/ppc.*/powerpc/ -e s/mips.*/mips/ -e s/sh[234].*/=
s"..., origin=3D<optimized out>, flavor=3D<optimized out>, target_var=3D<op=
timized out>) at ../make-4.3/src/variable.c:1187=0A=
#8  0x000000aaaaadccac in try_variable_definition (flocp=3D0xffffff8d70, li=
ne=3D<optimized out>, origin=3D<optimized out>, target_var=3D<optimized out=
>)=0A=
    at ../make-4.3/src/variable.c:1633=0A=
#9  0x000000aaaaad2dfc in eval (ebuf=3D<optimized out>, set_default=3D<opti=
mized out>) at ../make-4.3/src/read.c:750=0A=
#10 0x000000aaaaad451c in eval_makefile (filename=3D<optimized out>, flags=
=3D<optimized out>) at ../make-4.3/src/read.c:436=0A=
#11 0x000000aaaaad3cc4 in eval (ebuf=3D<optimized out>, set_default=3D<opti=
mized out>) at ../make-4.3/src/read.c:908=0A=
#12 0x000000aaaaad451c in eval_makefile (filename=3D<optimized out>, flags=
=3D<optimized out>) at ../make-4.3/src/read.c:436=0A=
#13 0x000000aaaaad4a70 in read_all_makefiles (makefiles=3D<optimized out>) =
at ../make-4.3/src/read.c:258=0A=
#14 0x000000aaaaab4f9c in main (argc=3D<optimized out>, argv=3D<optimized o=
ut>, envp=3D<optimized out>) at ../make-4.3/src/main.c:1945=0A=
(gdb) c=0A=
Continuing.=0A=
[Attaching after process 3441 vfork to child process 3444]=0A=
[New inferior 2 (process 3444)]=0A=
[Switching to process 3444]=0A=
=0A=
Thread 2.1 "make" hit Breakpoint 7, __spawni_child (arguments=3D0xffffff835=
0) at ../sysdeps/unix/sysv/linux/spawni.c:123=0A=
123	../sysdeps/unix/sysv/linux/spawni.c: No such file or directory.=0A=
(gdb) bt=0A=
#0  __spawni_child (arguments=3D0xffffff8350) at ../sysdeps/unix/sysv/linux=
/spawni.c:123=0A=
#1  0x000000fff7ef3d28 in __thread_start () at ../sysdeps/unix/sysv/linux/m=
ips/clone.S:135=0A=
(gdb) c=0A=
Continuing.=0A=
=0A=
Thread 2.1 "make" hit Breakpoint 2, getuid () at ../sysdeps/unix/syscall-te=
mplate.S:59=0A=
59	../sysdeps/unix/syscall-template.S: No such file or directory.=0A=
(gdb) bt=0A=
#0  getuid () at ../sysdeps/unix/syscall-template.S:59=0A=
#1  0x000000fff7eddedc in __spawni_child (arguments=3D0xffffff8350) at ../s=
ysdeps/unix/sysv/linux/spawni.c:189=0A=
#2  0x000000fff7ef3d28 in __thread_start () at ../sysdeps/unix/sysv/linux/m=
ips/clone.S:135=0A=
(gdb) c=0A=
Continuing.=0A=
=0A=
Thread 2.1 "make" hit Breakpoint 4, 0x000000fff7eb4f10 in execve () at ../s=
ysdeps/unix/syscall-template.S:78=0A=
78	../sysdeps/unix/syscall-template.S: No such file or directory.=0A=
(gdb) bt=0A=
#0  0x000000fff7eb4f10 in execve () at ../sysdeps/unix/syscall-template.S:7=
8=0A=
#1  0x000000fff7eddd10 in __spawni_child (arguments=3D0xffffff8350) at ../s=
ysdeps/unix/sysv/linux/spawni.c:292=0A=
#2  0x000000fff7ef3d28 in __thread_start () at ../sysdeps/unix/sysv/linux/m=
ips/clone.S:135=0A=
=0A=
It looks like we did not hit setresuid breakpoint=0A=
but reached execve ... strange=0A=
=0A=
Looking at glibc __spawni_child code=0A=
------------------------------------=0A=
=0A=
From cat -n ./2.31-r0/git/sysdeps/unix/sysv/linux/spawni.c=0A=
=0A=
   187    /* Set the effective user and group IDs.  */=0A=
   188    if ((attr->__flags & POSIX_SPAWN_RESETIDS) !=3D 0=0A=
   189        && (local_seteuid (__getuid ()) !=3D 0=0A=
   190            || local_setegid (__getgid ()) !=3D 0))=0A=
   191      goto fail;=0A=
   192  =0A=
=0A=
What is local_seteuid=0A=
---------------------=0A=
=0A=
From cat -n 2.31-r0/git/sysdeps/unix/sysv/linux/local-setxid.h=0A=
=0A=
     8	# define local_seteuid(id) INLINE_SYSCALL (setresuid, 3, -1, id, -1)=
=0A=
=0A=
    15  # define local_setegid(id) INLINE_SYSCALL (setresgid, 3, -1, id, -1=
)=0A=
=0A=
That explains why setresuid breakpoint was not hit. Code calls=0A=
directly system call.=0A=
=0A=
=0A=
What is internal_syscall3=0A=
-------------------------=0A=
=0A=
From cat -n 2.31-r0/git/sysdeps/unix/sysv/linux/mips/mips64/n64/sysdep.h=0A=
=0A=
   181  #define internal_syscall3(v0_init, input, number, err,             =
     \=0A=
   182                            arg1, arg2, arg3)                        =
     \=0A=
   183  ({                                                                 =
     \=0A=
   184          long _sys_result;                                          =
     \=0A=
   185                                                                     =
     \=0A=
   186          {                                                          =
     \=0A=
   187          register long __s0 asm ("$16") __attribute__ ((unused))    =
     \=0A=
   188            =3D (number);                                            =
       \=0A=
   189          register long __v0 asm ("$2");                             =
     \=0A=
   190          register long __a0 asm ("$4") =3D (long) (arg1);           =
       \=0A=
   191          register long __a1 asm ("$5") =3D (long) (arg2);           =
       \=0A=
   192          register long __a2 asm ("$6") =3D (long) (arg3);           =
       \=0A=
   193          register long __a3 asm ("$7");                             =
     \=0A=
   194          __asm__ volatile (                                         =
     \=0A=
   195          ".set\tnoreorder\n\t"                                      =
     \=0A=
   196          v0_init                                                    =
     \=0A=
   197          "syscall\n\t"                                              =
     \=0A=
   198          ".set\treorder"                                            =
     \=0A=
   199          : "=3Dr" (__v0), "=3Dr" (__a3)                             =
         \=0A=
   200          : input, "r" (__a0), "r" (__a1), "r" (__a2)                =
     \=0A=
   201          : __SYSCALL_CLOBBERS);                                     =
     \=0A=
   202          err =3D __a3;                                              =
       \=0A=
   203          _sys_result =3D __v0;                                      =
       \=0A=
   204          }                                                          =
     \=0A=
   205          _sys_result;                                               =
     \=0A=
   206  })=0A=
=0A=
In gdb again=0A=
------------=0A=
=0A=
(gdb) bt=0A=
#0  getuid () at ../sysdeps/unix/syscall-template.S:59=0A=
#1  0x000000fff7eddedc in __spawni_child (arguments=3D0xffffff8350) at ../s=
ysdeps/unix/sysv/linux/spawni.c:189=0A=
#2  0x000000fff7ef3d28 in __thread_start () at ../sysdeps/unix/sysv/linux/m=
ips/clone.S:135=0A=
(gdb) up=0A=
#1  0x000000fff7eddedc in __spawni_child (arguments=3D0xffffff8350) at ../s=
ysdeps/unix/sysv/linux/spawni.c:189=0A=
189	../sysdeps/unix/sysv/linux/spawni.c: No such file or directory.=0A=
(gdb) x /20i $pc - 20=0A=
   0xfff7eddec8 <__spawni_child+1032>:	nop=0A=
   0xfff7eddecc <__spawni_child+1036>:	b	0xfff7eddcc0 <__spawni_child+512>=
=0A=
   0xfff7edded0 <__spawni_child+1040>:	lw	a0,4(s1)=0A=
   0xfff7edded4 <__spawni_child+1044>:	jalr	t9=0A=
   0xfff7edded8 <__spawni_child+1048>:	nop=0A=
=3D> 0xfff7eddedc <__spawni_child+1052>:	li	a2,-1=0A=
   0xfff7eddee0 <__spawni_child+1056>:	dext	a1,v0,0x0,0x20=0A=
   0xfff7eddee4 <__spawni_child+1060>:	li	v0,5115=0A=
   0xfff7eddee8 <__spawni_child+1064>:	syscall=0A=
   0xfff7eddeec <__spawni_child+1068>:	bnez	a3,0xfff7ede000 <__spawni_child=
+1344>=0A=
   0xfff7eddef0 <__spawni_child+1072>:	nop=0A=
   0xfff7eddef4 <__spawni_child+1076>:	bnez	v0,0xfff7edde00 <__spawni_child=
+832>=0A=
   0xfff7eddef8 <__spawni_child+1080>:	ld	t9,-26712(gp)=0A=
   0xfff7eddefc <__spawni_child+1084>:	jalr	t9=0A=
   0xfff7eddf00 <__spawni_child+1088>:	nop=0A=
   0xfff7eddf04 <__spawni_child+1092>:	li	a2,-1=0A=
   0xfff7eddf08 <__spawni_child+1096>:	dext	a1,v0,0x0,0x20=0A=
   0xfff7eddf0c <__spawni_child+1100>:	li	v0,5117=0A=
   0xfff7eddf10 <__spawni_child+1104>:	syscall=0A=
   0xfff7eddf14 <__spawni_child+1108>:	bnez	a3,0xfff7ede000 <__spawni_child=
+1344>=0A=
   0xfff7eddf18 <__spawni_child+1112>:	nop=0A=
(gdb) display /i $pc=0A=
1: x/i $pc=0A=
=3D> 0xfff7eddedc <__spawni_child+1052>:	li	a2,-1=0A=
(gdb) si=0A=
0x000000fff7eb5a04	59	../sysdeps/unix/syscall-template.S: No such file or d=
irectory.=0A=
1: x/i $pc=0A=
=3D> 0xfff7eb5a04 <getuid+4>:	syscall=0A=
(gdb) info reg=0A=
                  zero               at               v0               v1=
=0A=
 R0   0000000000000000 000000001400a4e1 00000000000013ec 0000000000000000 =
=0A=
                    a0               a1               a2               a3=
=0A=
 R4   000000000000007f 000000fff7ff2d80 0000000000000000 0000000000000000 =
=0A=
                    a4               a5               a6               a7=
=0A=
 R8   0000000000000000 0000000000000000 0000000000000000 0000000000000000 =
=0A=
                    t0               t1               t2               t3=
=0A=
 R12  0000000000000000 ffffffff84080018 ffffffff801554b8 0000000000000000 =
=0A=
                    s0               s1               s2               s3=
=0A=
 R16  000000ffffff8588 000000ffffff84b8 0000000000000001 000000ffffff8350 =
=0A=
                    s4               s5               s6               s7=
=0A=
 R20  000000fff7e2ef80 000000fff7eb4f10 000000000000007f 000000000000007f =
=0A=
                    t8               t9               k0               k1=
=0A=
 R24  0000000000000000 000000fff7eb5a00 0000000000000010 0000000000000000 =
=0A=
                    gp               sp               s8               ra=
=0A=
 R28  000000fff7f9f5e0 000000fff7ff2e20 000000fff7ff2e20 000000fff7eddedc =
=0A=
                status               lo               hi         badvaddr=
=0A=
      000000000400a4f3 1b6ee11164e1e246 eb05325e15c10102 000000fff7ff2fe0 =
=0A=
                 cause               pc=0A=
      0000000010800024 000000fff7eb5a04 =0A=
                  fcsr              fir          restart=0A=
              00000000         007f0000 0000000000000000 =0A=
(gdb) p /d $a0=0A=
$1 =3D 127=0A=
=0A=
a0 value is 127! But it should be -1 according to local_seteuid call.=0A=
Why is that?=0A=
=0A=
This code looks quite wrong:=0A=
=0A=
   0xfff7edded0 <__spawni_child+1040>:	lw	a0,4(s1)=0A=
   0xfff7edded4 <__spawni_child+1044>:	jalr	t9=0A=
   0xfff7edded8 <__spawni_child+1048>:	nop=0A=
=3D> 0xfff7eddedc <__spawni_child+1052>:	li	a2,-1=0A=
   0xfff7eddee0 <__spawni_child+1056>:	dext	a1,v0,0x0,0x20=0A=
   0xfff7eddee4 <__spawni_child+1060>:	li	v0,5115=0A=
   0xfff7eddee8 <__spawni_child+1064>:	syscall=0A=
=0A=
There is not load of -1 into a0 before jumping to setresuid system call.=0A=
=0A=
In disassembly at certain point one can see:=0A=
=0A=
   0x000000fff7edde1c <+860>:	li	a0,127=0A=
=0A=
It seems either internal_syscall3 is wrong or compiler does not=0A=
process it correctly ... quite bad ...=0A=
=0A=
Looking at make make-4.3/src/job.c=0A=
----------------------------------=0A=
=0A=
It seems that posix_spawn would be used only if USE_POSIX_SPAWN defined.=0A=
=0A=
Test for USE_POSIX_SPAWN is in configure.ac=0A=
-------------------------------------------=0A=
=0A=
From cat -n make-4.3/configure.ac=0A=
=0A=
   382  AS_IF([test "$make_cv_posix_spawn" =3D yes],=0A=
   383    AC_CACHE_CHECK([for posix_spawn that fails synchronously],=0A=
   384      [make_cv_synchronous_posix_spawn],=0A=
   385      [make_cv_synchronous_posix_spawn=3Dno=0A=
   386       AC_RUN_IFELSE([AC_LANG_SOURCE([[=0A=
   387         #include <spawn.h>=0A=
   388         #include <string.h>=0A=
   389  =0A=
   390         extern char **environ;=0A=
   391  =0A=
   392         int main() {=0A=
   393           char* path =3D strdup("./non-existent");=0A=
   394           char *argv[[2]];=0A=
   395           argv[[0]] =3D path;=0A=
   396           argv[[1]] =3D  0;=0A=
   397           return posix_spawn(0, path, 0, 0, argv, environ);=0A=
   398         }]])],=0A=
   399         [make_cv_synchronous_posix_spawn=3Dno],=0A=
   400         [make_cv_synchronous_posix_spawn=3Dyes],=0A=
   401         [make_cv_synchronous_posix_spawn=3D"no (cross-compiling)"])]=
))=0A=
   402  =0A=
   403  AS_CASE([/$user_posix_spawn/$make_cv_posix_spawn/$make_cv_synchrono=
us_posix_spawn/],=0A=
   404    [*/no/*], [make_cv_posix_spawn=3Dno],=0A=
   405    [AC_DEFINE(USE_POSIX_SPAWN, 1, [Define to 1 to use posix_spawn().=
])=0A=
   406    ])=0A=
=0A=
Note USE_POSIX_SPAWN code was not present in make-4.2.1=0A=
-------------------------------------------------------=0A=
=0A=
Workaround=0A=
-----------=0A=
=0A=
In case of mips disable use of posix_spawn through ac_cv_func_posix_spawn=
=3Dno=0A=
configure option.=0A=
=0A=
Testing=0A=
-------=0A=
=0A=
Tested 'bitbake core-image-sato-sdk -c testimage' all tested are passed.=0A=
=0A=
Thanks,=0A=
Victor=0A=
=0A=
________________________________________=0A=
From: Richard Purdie <richard.purdie@linuxfoundation.org>=0A=
Sent: Thursday, February 27, 2020 11:45 PM=0A=
To: Jens Rehsack; openembedded-core@lists.openembedded.org=0A=
Cc: Bruce Ashfield; Victor Kamensky (kamensky)=0A=
Subject: Re: [OE-core] [PATCH v3] make: 4.2.1 -> 4.3=0A=
=0A=
On Mon, 2020-02-24 at 15:39 +0100, Jens Rehsack wrote:=0A=
> Announcement: https://lists.gnu.org/archive/html/bug-make/2020-01/msg0005=
7.html=0A=
>=0A=
> 1) Remove upstream provided patches 0001-glob-Do-not-assume-glibc-glob-in=
ternals.patch=0A=
>    and 0002-glob-Do-not-assume-glibc-glob-internals.patch.=0A=
>=0A=
> 2) License has been changed to GPLv3 only=0A=
>=0A=
> 3) Important bug-fix is=0A=
>    * https://lists.gnu.org/archive/html/bug-make/2018-09/msg00006.html=0A=
>=0A=
> 4) Backward-incompatibilities:=0A=
>    * Number signs (#) appearing inside a macro reference or function invo=
cation=0A=
>      no longer introduce comments and should not be escaped with backslas=
hes=0A=
>    * Previously appending using '+=3D' to an empty variable would result =
in a value=0A=
>      starting with a space.  Now the initial space is only added if the v=
ariable=0A=
>      already contains some value.  Similarly, appending an empty string d=
oes not=0A=
>      add a trailing space.=0A=
>=0A=
> Fix incompatibility issues between gnulib bundled with updated make fix i=
ssues=0A=
> in w32 compat sources.=0A=
>=0A=
> Signed-off-by: Jens Rehsack <sno@netbsd.org=0A=
=0A=
Unfortunately, crazy as this sounds, this is causing mips problems on=0A=
target with kernel module building. We only see the following failures=0A=
when this patch is included:=0A=
=0A=
https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/1612=0A=
https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/315=0A=
https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/1616=0A=
=0A=
Cheers,=0A=
=0A=
Richard=0A=
=0A=

--_002_BL0PR11MB3219D87CD091E6BC103A79F3CDE90BL0PR11MB3219namp_
Content-Type: text/x-patch;
	name="0001-make-disable-use-of-posix_spawn-on-mips.patch"
Content-Description: 0001-make-disable-use-of-posix_spawn-on-mips.patch
Content-Disposition: attachment;
	filename="0001-make-disable-use-of-posix_spawn-on-mips.patch"; size=1586;
	creation-date="Sat, 29 Feb 2020 07:34:35 GMT";
	modification-date="Sat, 29 Feb 2020 07:34:35 GMT"
Content-Transfer-Encoding: base64

RnJvbSAwODhlYmQ3YjFjNTBiYWJjZjEzMWNiMDM2NGNmODg0MWI2OTc4NjNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWaWN0b3IgS2FtZW5za3kgPGthbWVuc2t5QGNpc2NvLmNvbT4K
RGF0ZTogRnJpLCAyOCBGZWIgMjAyMCAyMjoyNjoxMSAtMDgwMApTdWJqZWN0OiBbUEFUQ0hdIG1h
a2U6IGRpc2FibGUgdXNlIG9mIHBvc2l4X3NwYXduIG9uIG1pcHMKCkFmdGVyIG1ha2UtNC4zIG1p
Z3JhdGlvbiBjaGlsZF9leGVjdXRlX2pvYiBmdW5jdGlvbiBzdGFydGVkCnVzaW5nIHBvc2l4X3Nw
YXduIGZ1bmN0aW9uLCB3aGljaCBoYXBwZW5zIHRvIGJlIGJyb2tlbiBvbiBtaXBzLgoKSXQgbWFu
aWZlc3RzIGl0c2VsZiBhcyB3aGVuIG1ha2UgZXhlY3V0ZWQgYnkgcm9vdCwgaXQgc3dpdGNoZXMK
cmVhbCB1c2VyIGlkIHRvIHdyb25nIHZhbHVlIGJlY2F1c2Ugb2Ygc29tZSBpc3N1ZXMgd2l0aCBk
aXJlY3QKc2V0cmVzdWlkIHN5c3RlbSBjYWxsIGRvbmUgaW4gZ2xpYmMgX19zcGF3bmlfY2hpbGQg
ZnVuY3Rpb24KdGhyb3VnaCBpbmxpbmUgYXNzZW1ibGUgYW5kL29yIGdjYyBjb21waWxpbmcgaXQg
cHJvZHVjZXMgd3JvbmcKY29kZS4gSS5lIGluc3RlYWQgb2YgcGFzc2luZyAtMSBwb3NpeF9zcGF3
biBmdW5jdGlvbiBpbmNvcnJlY3RseQpwYXNzZXMgMTI3IGFzIHJ1aWQuIFN1YnNlcXVlbnRseSBq
b2Igc3RhcnRlZCBieSBtYWtlIGNhbiBmYWlsCndpdGggcGVybWlzc2lvbiBpc3N1ZSBiZWNhdXNl
IHRoZXkgcnVuIHVuZGVyIHdyb25nIHVzZXIuCgpGb3Igbm93IHdvcmthcm91bmQgaXMgdXNlZCBi
eSBleHBsaWNpdGx5IGRpc2FibGluZyBwb3NpeF9zcGF3bgpjYWxsIHVzZSBieSBtYWtlIG9uIG1p
cHMgdGhyb3VnaCBjb25maWd1cmUgdmFyaWFibGUuCgpTaWduZWQtb2ZmLWJ5OiBWaWN0b3IgS2Ft
ZW5za3kgPGthbWVuc2t5QGNpc2NvLmNvbT4KLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWFr
ZS9tYWtlXzQuMy5iYiB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21ha2UvbWFrZV80LjMuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvbWFrZS9tYWtlXzQuMy5iYgppbmRleCA3MGNhZjBhZTE2Li41ZmE3
MDU5MTY5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWFrZS9tYWtlXzQuMy5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWFrZS9tYWtlXzQuMy5iYgpAQCAtMTIsNiAr
MTIsOSBAQCBTUkNfVVJJICs9ICJcCiAKIEVYVFJBX09FQ09ORiArPSAiLS13aXRob3V0LWd1aWxl
IgogCitFWFRSQV9PRUNPTkZfYXBwZW5kX21pcHM9IiBhY19jdl9mdW5jX3Bvc2l4X3NwYXduPW5v
IgorRVhUUkFfT0VDT05GX2FwcGVuZF9taXBzNjQ9IiBhY19jdl9mdW5jX3Bvc2l4X3NwYXduPW5v
IgorCiBTUkNfVVJJW21kNXN1bV0gPSAiZDVjNDBlN2JkMWU5N2E3NDA0ZjVkM2JlOTgyZjQ3OWEi
CiBTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGUxYTQ0MWM0ZWRmOTUyNTIxZGIzMGJmY2E4MGJhYWU4
NmEwZmYxYWNkMGEwMDQwMjk5OTM0NGYwNGM0NWU4MiIKIAotLSAKMi4yMS4xCgo=

--_002_BL0PR11MB3219D87CD091E6BC103A79F3CDE90BL0PR11MB3219namp_--
