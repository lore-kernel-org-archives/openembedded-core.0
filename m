Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.128])
 by mx.groups.io with SMTP id smtpd.web09.3086.1610724460509157130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 07:27:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@microsoft.com header.s=selector2 header.b=PJITy96l;
 spf=pass (domain: microsoft.com, ip: 40.107.8.128, mailfrom: luca.boccassi@microsoft.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHpXtJ/ivYoKg/mJts4xL/RWXHa7v7FuUxfP1stxRviF/Tjz+YY+CbccEuu8oRmtwxoKoKkXlKuT+PJU0ZAOuCqAUdsEKLmnElG72a7IPWRs+FQ3lXq3pFUd7Adi1NPtOdgAqPSMvOhwH6+zySTCk6UPYJTXUWL5AzvvBDdqlhXJitB6IKDDdq9rY0v7vODh3d9lGPxo+zP8OGlWnIwoKgcGR3seM0GRMPk/SWveBmR1FNq0ACdTSfbgyJMsHmxoO5u653ca6e5MPP6f36g/1OWlWU+z2KvOu980sBWf+UrtSKtstD905058weDOSsf9Z1SbTVv832KHo/URP/qldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YJmNhU84GS2Kl3u4wtvyV40CTXTsyOg+36Ne/8l1KU=;
 b=TNwDVNTjseKIw+oD6slHyd2Bmhrip+3utAXaxerFxk8xNLRxAX7iblT+QB628Zzk52p7NpKydIrFBrYq0FDj058N1/gLJDFi7YUmIM3dnM/ZU5bYIN9XKagmDHySUguhcaaFCN9cZ8YetnuK8Qy7vruKZd/CPGRcXU+MFiS7Mgv4vIdESKnUj7+QGEw9fQE4Sk9qGgDkg/G30xkbYmzW1q7M+T5rltH0/CzVjez867nqZKTRjfClzgS6sHpT1e8KGU8yoG9FuWxRHTnHyM5eRz4SxWUZvnxAUUDrpHgTr0cgBE+f3Pdq+HxVUi5A7dLBKydKe5NZObeoUJ5DpKdnYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YJmNhU84GS2Kl3u4wtvyV40CTXTsyOg+36Ne/8l1KU=;
 b=PJITy96lbDKd/u5vWRtfEs91vjMt4hDoM2rP6lYjV7Oi9t/hMaJ6J83wEqE7FjbOkHnzhm8ZkoCgvaUnybkgOy0f6m5EJ8wykYJ9S67veo80ZUgcNaGw+gYejM+nAS69JI2IRDWvkaIf4nPo4++larxM9MaL8oPvuyVt0M2+MKw=
Received: from (2603:10a6:821:7::20) by
 VI1PR83MB0400.EURPRD83.prod.outlook.com (2603:10a6:800:19e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.2; Fri, 15 Jan
 2021 15:27:37 +0000
Received: from VI1PR83MB0205.EURPRD83.prod.outlook.com
 ([fe80::ac81:d73d:aee2:ab62]) by VI1PR83MB0205.EURPRD83.prod.outlook.com
 ([fe80::ac81:d73d:aee2:ab62%3]) with mapi id 15.20.3784.003; Fri, 15 Jan 2021
 15:27:37 +0000
From: "Luca Boccassi" <luca.boccassi@microsoft.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "paul.gortmaker@windriver.com"
	<paul.gortmaker@windriver.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] systemd: dont spew hidepid mount errors for kernels < v5.8
Thread-Topic: [PATCH] systemd: dont spew hidepid mount errors for kernels <
 v5.8
Thread-Index: AQHW6v8fqMq71K27ak2LTnjm7Qp9qKooz+YA
Date: Fri, 15 Jan 2021 15:27:37 +0000
Message-ID: <b47a4863b3ad8e87bf68cafce781fc51ad683db5.camel@microsoft.com>
References: <20210115052615.29893-1-paul.gortmaker@windriver.com>
In-Reply-To: <20210115052615.29893-1-paul.gortmaker@windriver.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5-1.2 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=microsoft.com;
x-originating-ip: [88.98.246.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 31cb2680-1adc-4434-d32e-08d8b96a16d5
x-ms-traffictypediagnostic: VI1PR83MB0400:
x-microsoft-antispam-prvs: 
 <VI1PR83MB040076BF2AFF5536D85004FAF1A79@VI1PR83MB0400.EURPRD83.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 G0k3rD4BNdaiG8eTg4v50BVfN6u106ddF3OQsVxJWt0rsoxRSBrGH+pRdlfHeOvtRuQgWWFZpk5CAZuuC5BVL6noqqMwon4dUbdEbBE5XCd66hesEAA8Tr8JVNSZNRJ2f9i0VzftfcHWV96lD2mS4vutfy0EfmvD5FFSer+582ghs6kEeuSn1WHe9/3lYQjgOl7+wodEarBb6HDG7QStN/XXllcYAo2TTsPt5+Ogxm0+lzqB3fpJGa98F8/TR3JUgQmiu9F7W9OKloD1bsVxyRR2o7yLNYIsW4St5g4FWSanfn/gFw5hIvHaQDvAQQpoatPpRPtJVh7VRvyK/0N7MsjZs7VP1IxmEkYdgW0Syu7r8R/JhiEmqmMuO9UMHXZAoXM+fUDRHPfTBDxP1rWOAS1xM1Uz8jJxUJoQjn7rilNSd4y6Npug6yJM7mp0aOqKo45acARXurPZIPutlB1gsyRgmea+pEH+4aVgHN22PPRE/4e6WpWwVrHuxU1TD5GLWH8v5qmCRb2Xj+FV4MwVLKEhXWbA71GNEjk8d/ngMMz7ToUZe9lezyD+nLxBrSNBOA1R9BSdZ7rBRHzcQlRZ86bLZoXwRNcK+xvyjWsfvjMUruN4k3A5r4tr0NpcZ0dJbBcBwgIhA2i6xb2T+C9RFw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR83MB0205.EURPRD83.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(71200400001)(316002)(478600001)(966005)(10290500003)(83380400001)(6512007)(110136005)(86362001)(26005)(4326008)(36756003)(82950400001)(82960400001)(8676002)(186003)(66616009)(2906002)(64756008)(66446008)(66556008)(66946007)(6506007)(6486002)(76116006)(66476007)(2616005)(99936003)(5660300002)(8936002)(192303002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?aEh3QTRTcDBReVhTaWVIek5pQ1ZGSzV6TnhydUxyWitFcGNVdEZoOVZZYW5m?=
 =?utf-8?B?SVNXcDRoSnAvbFJlZ3cwOElYc090YUU0KzNCbnUxNjVJUndPaGRHNjVsNTVP?=
 =?utf-8?B?eUVPY001U05uMXdPSWE1US9ydkNlaGRBMStON2x4TzBFeFgwTmJhMGdIRGpD?=
 =?utf-8?B?cUgyTDlLaUQ2dXBTNGxaOWFJYjNGRjN6dVZOR1RSRHNsNzdVb2hkd2VFb29v?=
 =?utf-8?B?OUJua0xIOVRMVFc4UmVWOGx3OUpVdVNYTGtyYkJVa1QvTUN5ZFFxb1NsbXFK?=
 =?utf-8?B?RGtFaXV3RzhMQ1RFdWVJUmdVY2ZUVDh0dmJzSHVQL0JWYkp4Y0VhdHVZVW8x?=
 =?utf-8?B?VWJBa3NLT0VtNVVkMUtrL3cxYzQ3MDhXTTZsTTFTdG5QdE1iR25veTV0UzN5?=
 =?utf-8?B?KzB6dU5hSDhvNlc0aTVPZVR3UkovNEJaZHd2d3g1L1BzZHZqRXRwdUk1ZkdV?=
 =?utf-8?B?eUswN29HWFlVUUcxZlY1RUFTSk1mTjJXZVIvYjJCTmJMN0pWM2FlUmFjZkFk?=
 =?utf-8?B?SDRYSm10dmRNSWdYR3pZOXVycEpPYVJtTWl4VUVHSkFWOW1mWU9QNk1HYzR6?=
 =?utf-8?B?WDJLaXRjMS9sTytZWW5FZFBDbW9pd3AvQ2srOWhqVFR6ZTZoVFd5Z0d3UWpv?=
 =?utf-8?B?RnpGUXByc0tZdXJHYVRBY1RQTzRGU1UvLy8ybGdIam9NcHF5cjdlUzZ1ZmJw?=
 =?utf-8?B?aDlCWFB2UGRGc1Y3d2MyU2xnZWI4enR2bFBLU3FwaWVEb01zWHovK25ZeWgz?=
 =?utf-8?B?QU9jdGtPYm1rNzRoM1dDalJjem9lbzJjSWJQZnZ4d2RuUzkvL0dlNUZtcjZU?=
 =?utf-8?B?VlhxS0NkTGw4STIzWTh6UmcySnd4V2tDRHJsdDk4cFpXaUhRWUVjUjJraHE4?=
 =?utf-8?B?dXV0c3JETmpmTzFLQ3Q3MmZ0cGx5M3hGUjlqTnJRMDR6VUViQmlEVG5OeHJy?=
 =?utf-8?B?eTNBWE1ZMFNOSHV6Tkd1S0ovem9SOXJEMFlKbnJTQkN6Tzh0c0pSdUYwdG8x?=
 =?utf-8?B?WDNyZDVDQ1dTRk5Vc1lJbWp3blQ2VnZxWjBRRHlkdUZ4NDZCaW9XSHROS0k0?=
 =?utf-8?B?MmdNeVdWTXR5TVg4NThvUUxSMXhSd0pBbXFwblQ2Z29iY3JFV3UrSmFEcy9C?=
 =?utf-8?B?VUs5bVBpMjVOZ2NjNnY0bXEvb0pRQTRjNGxLMEFOSVRlZlpFbWZrSk9JVy9P?=
 =?utf-8?B?d0xNUk13Snh3Nm1SSDIyZ3kxTVFlZU5VSFEyQTkxaGtyQnVpeXhmVXI3b3ZR?=
 =?utf-8?B?SE51K000TVZyb2tLUFNYZ3FVRURwS2oveGx3dW5vZ1pIQkVXNktabENXdjBk?=
 =?utf-8?B?dlYzMm1lL254dHhBdzRHRFVONEZxcnhhNERrdnVGQ0NVNG44R01aY3M5VEsy?=
 =?utf-8?B?eUt0bUdseVpBdUJ1WVBlZ0p3WFFaR2t6U09iZmpBMUJpaDk3anYzWGgwcC96?=
 =?utf-8?B?YmZkVXpVMEExczl5d3hvLzRmMy8zbkpqdVZRVXNnPT0=?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR83MB0205.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31cb2680-1adc-4434-d32e-08d8b96a16d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 15:27:37.1360
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qdh+o/kWLS8YVWcZmgKpkrHiNQ5vLUNVodSdxGVzbwrnd9DYMhuKV+LFZHhd2+trfI+nArgym12y45/KdLadsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR83MB0400
X-Groupsio-MsgNum: 146828
Content-Language: en-US
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-pTtltbKokP+9oMAAWsYX"

--=-pTtltbKokP+9oMAAWsYX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-01-15 at 00:26 -0500, Paul Gortmaker wrote:
> Recent systemd started using ascii args to "hidepid=3D" mount options
> for proc fs - unconditionally -- even though kernels older than v5.8
> emit an error message on each attempt:
>=20
> root@qemux86-64:~# cat /proc/version
> Linux version 5.4.87-yocto-standard (oe-user@oe-host) (gcc version 10.2.0=
 (GCC)) #1 SMP PREEMPT Fri Jan 8 01:47:13 UTC 2021
> root@qemux86-64:~# dmesg|grep proc:
> [   29.487995] proc: Bad value for 'hidepid'
> [   43.170571] proc: Bad value for 'hidepid'
> [   44.175615] proc: Bad value for 'hidepid'
> [   46.213300] proc: Bad value for 'hidepid'
> root@qemux86-64:~#
>=20
> Simply ignoring them as the systemd maintainer unconditionally says
> is the resolution is clearly not acceptable, given the above.
>=20
> Add a kernel version check to avoid calling mount with invalid args.
> Further details are within the enclosed systemd commit.
>=20
> Cc: Luca Boccassi <luca.boccassi@microsoft.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>=20
> diff --git a/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mou=
nt-error-with-invalid-options-o.patch b/meta/recipes-core/systemd/systemd/0=
027-proc-dont-trigger-mount-error-with-invalid-options-o.patch
> new file mode 100644
> index 000000000000..65e7eca32d05
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0027-proc-dont-trigger-mount-erro=
r-with-invalid-options-o.patch
> @@ -0,0 +1,126 @@
> +From 297aba739cd689e4dc9f43bb1422ec88d481099a Mon Sep 17 00:00:00 2001
> +From: Paul Gortmaker <paul.gortmaker@windriver.com>
> +Date: Wed, 13 Jan 2021 21:09:33 +0000
> +Subject: [PATCH] proc: dont trigger mount error with invalid options on =
old
> + kernels
> +
> +As of commit 4e39995371738b04d98d27b0d34ea8fe09ec9fab ("core: introduce
> +ProtectProc=3D and ProcSubset=3D to expose hidepid=3D and subset=3D proc=
fs
> +mount options") kernels older than v5.8 generate multple warnings at
> +boot, as seen in this Yocto build from today:
> +
> +     qemux86-64 login: root
> +     [   65.829009] proc: Bad value for 'hidepid'
> +     root@qemux86-64:~# dmesg|grep proc:
> +     [   16.990706] proc: Bad value for 'hidepid'
> +     [   28.060178] proc: Bad value for 'hidepid'
> +     [   28.874229] proc: Bad value for 'hidepid'
> +     [   32.685107] proc: Bad value for 'hidepid'
> +     [   65.829009] proc: Bad value for 'hidepid'
> +     root@qemux86-64:~#
> +
> +The systemd maintainer has dismissed this as something people should
> +simply ignore[1] and has no interest in trying to avoid it by
> +proactively checking the kernel version, so people can safely assume
> +that they will never see this version check commit upstream.
> +
> +However, as can be seen above, telling people to just ignore it is not
> +an option, as we'll end up answering the same question and dealing with
> +the same bug over and over again.
> +
> +The commit that triggers this is systemd v247-rc1~378^2~3 -- so any
> +systemd 247 and above plus kernel v5.7 or older will need this.
> +
> +[1] https://github.com/systemd/systemd/issues/16896
> +
> +Upstream-Status: Actively hostile
> +Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> +
> +diff --git a/src/core/namespace.c b/src/core/namespace.c
> +index cdf427a6ea93..f8fc33a89fc2 100644
> +--- a/src/core/namespace.c
> ++++ b/src/core/namespace.c
> +@@ -4,7 +4,9 @@
> + #include <linux/loop.h>
> + #include <sched.h>
> + #include <stdio.h>
> ++#include <stdlib.h>
> + #include <sys/mount.h>
> ++#include <sys/utsname.h>
> + #include <unistd.h>
> + #include <linux/fs.h>
> +=20
> +@@ -859,14 +861,34 @@ static int mount_sysfs(const MountEntry *m) {
> + }
> +=20
> + static int mount_procfs(const MountEntry *m, const NamespaceInfo *ns_in=
fo) {
> ++        _cleanup_free_ char *opts =3D NULL;
> +         const char *entry_path;
> +-        int r;
> ++        int r, major, minor;
> ++        struct utsname uts;
> ++        bool old =3D false;
> +=20
> +         assert(m);
> +         assert(ns_info);
> +=20
> +         entry_path =3D mount_entry_path(m);
> +=20
> ++        /* If uname says that the system is older than v5.8, then the t=
extual hidepid=3D stuff is not
> ++         * supported by the kernel, and thus the per-instance hidepid=
=3D neither, which means we
> ++         * really don't want to use it, since it would affect our host'=
s /proc * mount. Hence let's
> ++         * gracefully fallback to a classic, unrestricted version. */
> ++
> ++        r =3D uname(&uts);
> ++        if (r < 0)
> ++               return errno;
> ++
> ++        major =3D atoi(uts.release);
> ++        minor =3D atoi(strchr(uts.release, '.') + 1);
> ++
> ++        if (major < 5 || (major =3D=3D 5 && minor < 8)) {
> ++                log_debug("Pre v5.8 kernel detected [v%d.%d] - skipping=
 hidepid=3D", major, minor);
> ++                old =3D true;
> ++        }
> ++
> +         /* Mount a new instance, so that we get the one that matches ou=
r user namespace, if we are running in
> +          * one. i.e we don't reuse existing mounts here under any condi=
tion, we want a new instance owned by
> +          * our user namespace and with our hidepid=3D settings applied.=
 Hence, let's get rid of everything
> +@@ -875,9 +897,8 @@ static int mount_procfs(const MountEntry *m, const N=
amespaceInfo *ns_info) {
> +         (void) mkdir_p_label(entry_path, 0755);
> +         (void) umount_recursive(entry_path, 0);
> +=20
> +-        if (ns_info->protect_proc !=3D PROTECT_PROC_DEFAULT ||
> +-            ns_info->proc_subset !=3D PROC_SUBSET_ALL) {
> +-                _cleanup_free_ char *opts =3D NULL;
> ++        if (!old && (ns_info->protect_proc !=3D PROTECT_PROC_DEFAULT ||
> ++            ns_info->proc_subset !=3D PROC_SUBSET_ALL)) {
> +=20
> +                 /* Starting with kernel 5.8 procfs' hidepid=3D logic is=
 truly per-instance (previously it
> +                  * pretended to be per-instance but actually was per-na=
mespace), hence let's make use of it
> +@@ -891,21 +912,9 @@ static int mount_procfs(const MountEntry *m, const =
NamespaceInfo *ns_info) {
> +                                ns_info->proc_subset =3D=3D PROC_SUBSET_=
PID ? ",subset=3Dpid" : "");
> +                 if (!opts)
> +                         return -ENOMEM;
> +-
> +-                r =3D mount_nofollow_verbose(LOG_DEBUG, "proc", entry_p=
ath, "proc", MS_NOSUID|MS_NOEXEC|MS_NODEV, opts);
> +-                if (r < 0) {
> +-                        if (r !=3D -EINVAL)
> +-                                return r;
> +-
> +-                        /* If this failed with EINVAL then this likely =
means the textual hidepid=3D stuff is
> +-                         * not supported by the kernel, and thus the pe=
r-instance hidepid=3D neither, which
> +-                         * means we really don't want to use it, since =
it would affect our host's /proc
> +-                         * mount. Hence let's gracefully fallback to a =
classic, unrestricted version. */
> +-                } else
> +-                        return 1;

Why is it necessary to remove all of the above? It's already skipped,
so it seems this patch could be at least half the size - give it's
permanent technical debt, that does make a difference.

> +         }
> +=20
> +-        r =3D mount_nofollow_verbose(LOG_DEBUG, "proc", entry_path, "pr=
oc", MS_NOSUID|MS_NOEXEC|MS_NODEV, NULL);
> ++        r =3D mount_nofollow_verbose(LOG_DEBUG, "proc", entry_path, "pr=
oc", MS_NOSUID|MS_NOEXEC|MS_NODEV, opts);
> +         if (r < 0)
> +                 return r;
> +=20
> +--=20
> +2.29.2
> +
> diff --git a/meta/recipes-core/systemd/systemd_247.2.bb b/meta/recipes-co=
re/systemd/systemd_247.2.bb
> index 5eea78eff353..84d997196cb6 100644
> --- a/meta/recipes-core/systemd/systemd_247.2.bb
> +++ b/meta/recipes-core/systemd/systemd_247.2.bb
> @@ -23,6 +23,7 @@ SRC_URI +=3D "file://touchscreen.rules \
>             file://0003-implment-systemd-sysv-install-for-OE.patch \
>             file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-sla=
sh.patch \
>             file://0001-logind-Restore-chvt-as-non-root-user-without-polk=
it.patch \
> +           file://0027-proc-dont-trigger-mount-error-with-invalid-option=
s-o.patch \
>             "
> =20
>  # patches needed by musl

--=20
Kind regards,
Luca Boccassi

--=-pTtltbKokP+9oMAAWsYX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmABtGcACgkQSylmgFB4
UWKbrwf+PUtRzVPWc3jMbLVCe/b9UjyrxNKebXmrkvew1xApIjrT6xJy2JiMU+uc
kCD15GzfKbVPuwRWK/FVS2wTiKvLkK2dd/x/iCY6UCHx1nDsjaHLlMRUTnIIH3Ui
lcJSytsai5MnGRDY+lXrAniYTSs8XgOVlp5aAk78ecr9SiQ4scqWqMRg1WaeowPl
0D74eTYZX0PmyxqIHQV89SpnugTI6S7f/OF/egM2YQQV5DWSYTMsENr6PcZGPabJ
IzRlaVfzKLadSDW1XCGhR4MvL5mz9vTCMBYHK7Q6eE9uyezr7zMyoG/w0bgWGGX3
VaH9ZZuNsFmWS0pxywmHHbt76b7x5g==
=Wiur
-----END PGP SIGNATURE-----

--=-pTtltbKokP+9oMAAWsYX--
