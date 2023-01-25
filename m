Return-Path: <ravineet.a.singh@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D74C27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:20:47 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.109])
 by mx.groups.io with SMTP id smtpd.web11.46037.1674656441200307171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:20:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@estab.onmicrosoft.com header.s=selector2-estab-onmicrosoft-com header.b=lbdqrlZJ;
 spf=pass (domain: est.tech, ip: 40.107.15.109, mailfrom: ravineet.a.singh@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WedsWzC8ECutpL5ugsYUVHpj3EUH46f16gx2Ffot04y9BUSRzBhfLMQiqON0Q4R2Og/UvnNt7ikQ+OtCKuvkt57NSgRkb6hvr8d3SQ09RgOM4YN1+GEHW27j9A0zxAhCqu1lTcvT3i6x4D9LJsNTLfvdyhRMExrMgb6QF8aGZ8YqMtFZmibKXn++JH5WlUCql0I4TPUfRvzTHQB7bnAYZhE6yg0sY/WranLJtmYnVFC6cSg4gLm7eF/984vnfTi4n3JcLX6hB25QCkZpR23h2pMmSvbfpqG9Wib0FbrU5SW+Nrzz7QlUBRNKpEEylqfRC76tS5Kof5vUv9fQcOc3Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ewtj8Z89+k+5qtrFPZC7pxYf035gY/Ay9gSKLNuKLOk=;
 b=K73VELP//6ur0rneYGvLDDKabX/O+krvu9bwLbgd1DN+6Zg9jSUqJZ1gM+PJtHkqvmlpiJI/aGy7x5AOtHwkK22sQWRGXO3JM4D9YFopX4F/+JneJRIfY43I5JlbWzf0ZkOU3la9DtSUp0yEDJqjOwyEhRsHrfLH+D6zB1jilba0fE9B3OWSOJTeK1NSs0aKqVJ9DNOjfwjjOlsFMdr3q64mjflHCuMjRGFN/9sSe0G+4VUjfoCV/74k1coMXN3zNInjhKpf97OWDSgv6HpZvL3oczio49AIME0v5kwtUO4+LYINVImX4KEDdrkvay3xQv/TOFJfH+YRGVL7WKm06w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com;
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ewtj8Z89+k+5qtrFPZC7pxYf035gY/Ay9gSKLNuKLOk=;
 b=lbdqrlZJ3+L1in42YHkXbnxIIEjC7/YpBAX0xtIcl7/e68tdU9MZPzp9BiEcUKx+txKNt8haz0iK2tZjd/TcOQ0MR2TMCUGRDsvzvSonZEyyCfLXKWVyd/NUoNhrs7sRixt4DmXb4MviXVR4t9evfr56LXBVR4q7sjizr2hGf6s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6c::22)
 by PR3P189MB1001.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 14:20:37 +0000
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38]) by GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38%4]) with mapi id 15.20.6002.028; Wed, 25 Jan 2023
 14:20:37 +0000
Date: Wed, 25 Jan 2023 15:20:35 +0100
From: Ravineet Singh <ravineet.a.singh@est.tech>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] gnutls: add initial ptest support
Message-ID: <20230125142035.u3ogfurrd5vomuiy@serber-ng.hemma>
References: <20230123081621.7517-1-ravineet.a.singh@est.tech>
 <CANNYZj8pETWuN8FuyAke2rZ9d2TH6_Ly0goWMnYHuZaYj7xetw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj8pETWuN8FuyAke2rZ9d2TH6_Ly0goWMnYHuZaYj7xetw@mail.gmail.com>
X-ClientProxiedBy: GV3P280CA0042.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::34) To GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXP189MB2053:EE_|PR3P189MB1001:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bec60f9-a69d-4864-65c9-08dafedf5477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IcDDcGFixE6bmcYR1f0yN0Qo02uT+YBjOpIKNxkfBFiKnv6SMf6PJo3gKVvK1nLvh2o8LiMBCRo2H5+Lq7jIJ2Exykr5eQrZWHoARhlradV8mZSV/IWjA6YRs6r5TcOmtNCGJIY09fwus+5rqQnTqW7bYZvPWGBQ1mfqUKfrEFeMZfjUbfCWTTbsFbFWFR0tLlZD8r+r+OxA4mw2dR+qpZqHebKzeBo6OowW8d8zCRDYnSq3verDpHatO4ybxhr2Sg561pO52z/4jC9YQQ6PFpAtnDzFV02iJmEwsorW58R6hW1R29lBj69LRI6Gr5E4bvoXVfUQU8UyqC12+I/1QuFXj++Z74RvwaZryvenYrjLq2qOJskvFUNI+bTz9wdSRxmYEOirh4wl++tjmcELH319TYg4lqIY+419O8jzl/3KJ9zhv/MdSJnb1SJva/fMYk0aVdwCLCyEMnlKeb7tUHaPbVTukHRqQ7QkdhVKcfjfzKaVWuO0W1rHHMsfs45yBC6Lk0MvusY1JYK8YO3epFQ8Djq8cPt6CHTjvNDIxcQBg3K4noD0kTFrydycFXCgng0nyNKCR/JS6T25gTwvTZHvHnU56ZHe3ij7qVJiN2YREp2PBBXVUhG0nnzhqObWRj5V6NCnxVDQF11A/pK5ONPBqUYdTSoaw/aX5AufkQI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP189MB2053.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(39840400004)(136003)(396003)(346002)(451199018)(5660300002)(2906002)(86362001)(478600001)(6486002)(966005)(83380400001)(186003)(1076003)(9686003)(6512007)(6506007)(26005)(316002)(41300700001)(8936002)(4326008)(8676002)(66556008)(66946007)(6916009)(66476007)(38100700002)(66899018);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dSSJQMqgRUQqOO1BxNFLg5LAec5E3siLjowXqF9Nd2Mw8xOlwWNycrj8mBC5?=
 =?us-ascii?Q?x/QUGPr6KD8dM6gziXS1Fs+YPkb9XNLbQEgRbN0Tmjq71gfrN4P4xnDPWuVI?=
 =?us-ascii?Q?CoNiIfSDyGPYcLVFNKzEE3XO6FeklCBMXsQ+6lDqtM+PAGreF51obg3c4W/o?=
 =?us-ascii?Q?Ic6YrLdmJM67aUF3O0l6Ctv/OvQPbwPLEAyi24GDctYoWkCol0t3urI/Xmcl?=
 =?us-ascii?Q?0rYIWVs7QCKHZXT9da7xb9CfBeGcRpYs9D84OCpn0bOlz5rAbELYuO0SKVVJ?=
 =?us-ascii?Q?ItgByyPTNQWe3jcGRNIsJbY+oAAwW1jP34F9JU1fKRAfhEjUtK8mnWy8uOLZ?=
 =?us-ascii?Q?2fg4PHKLPAZiUEap2zoFtuF0gzGPpyGKnUYxKZ10/vPwGW9LcF5VOm6Jykmd?=
 =?us-ascii?Q?Xtk8bB7wAO6txcc5t6B5F+0OeDrLOSaqN+SI72i2Z/1oXQ2gR0D83+ctwzYm?=
 =?us-ascii?Q?4wK9BbSvh4mcm/RhYCTDkP/eDZlrAJ0z0skifBA9yeZl0E/iSKKQl07WkJUj?=
 =?us-ascii?Q?zxz1vvpIHafrCZwI2d1NTlVBPtBeAQhU9gPW3L7zK9fk1TVZ04Y6uBiqdpHh?=
 =?us-ascii?Q?F/fYB/pVGEfsi8+Ya2TxaR67/38YSeBcwjCxgVKR79/R9zbFQDWPFzID6icc?=
 =?us-ascii?Q?bqXmSaja4Eq4+IxjsByUW4D93YNqxE7IWk94ocudq1aK/PdtBde3jEq/C0qz?=
 =?us-ascii?Q?MxNxSzf4ryZmA76Kg2+WNNMMpdXUw8bVlTNOuU9ooUV2RnpNaj3CAducSrqS?=
 =?us-ascii?Q?SyX1zV3/WS71vHEkVG+cRfxRvHUbnng/OMMmaoK6hh9jf6YjW5VWzncWLDC9?=
 =?us-ascii?Q?6XpZ1hiXBjRmXQKisoUZcDtyepZcLt/oZFmZcz0IQMKa0KBtETDMfdZIyi4Q?=
 =?us-ascii?Q?TCR+pSWgXfCVsm4lFcWQ2Iz41aKkObpZ3OjTdY4qxq4Y4451qw1qk4frMbyR?=
 =?us-ascii?Q?vnkLEF1FGlNhtGO46SvYLl/kzRQMeAaVOYLmaGKVDdsAIwylNoEAS/L8Ll1Y?=
 =?us-ascii?Q?OUrEWX9xnCvnVckhslQ7L8rAus0epAlxBL8llExMB5xyUKXcc2CSs3+OLZCE?=
 =?us-ascii?Q?tv+3fyZNb6QJ2j55LEPVRt8BObMznhL+E9mdnVZnQ0Tyvuw5uEb+KAEnmZH7?=
 =?us-ascii?Q?3HHjoc0qgRnWKdx5DjEEJiGSLSZTtdaY8JTbQlXbgHQ/8gpD6ro4qqeBas1B?=
 =?us-ascii?Q?d7SicTGmqJpgTbYMzhFOrCppVnENabMosFNqcuxEPFNyQqD0oow6HmmwOG4Q?=
 =?us-ascii?Q?UH6o0fw5F71TArUcOVyqC2h9TMWOO/HWZDHjSJ7xF8X4C6nq0Svmmu5zguDN?=
 =?us-ascii?Q?hdjj6AktPmtQlynYBLuAHw8ip1Tgc55oGoG3YN+/eS8avKSGBzPVQ1KaDd6R?=
 =?us-ascii?Q?plqMRPgK04DgUpmw+oLBUXMnSq6seo52JGuqSu5ZR0RCqj3AE+weOxdgal/I?=
 =?us-ascii?Q?pHtEpCoq15zlpuIMSlqB0XhMCGspOxJ0aOf+Hn8t8HzzTU8NhJFwoW4EUy/W?=
 =?us-ascii?Q?FpKMcIJSi7v/GbhWT3VO+uT5qEyY+jckyjlnYxPQV4DuqNFdXzXZpmBXGvjz?=
 =?us-ascii?Q?3a5D8gvon0JHqetWzfQ+b/ISTmyUOMt2Z4fWiFcIlEckKqFdNaiC1eGJzeyp?=
 =?us-ascii?Q?gg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bec60f9-a69d-4864-65c9-08dafedf5477
X-MS-Exchange-CrossTenant-AuthSource: GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 14:20:37.5725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4co8fqbTFXIDhzb0ODThMuPAoHe6Sojmjc1Nk7HOWng5qfaEdDo8/x0TRFTq8T2Cfkzf4IPpMDg8mYPaA40+qsGxH2wm2cZdDlGVbGdxBkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1001
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176349

On Wed, Jan 25, 2023 at 03:02:27PM +0100, Alexander Kanavin wrote:
> Thanks! Before this can be added I'd like to clarify two things:
> - is execution time of 184 with or without kvm?
It is with kvm.
> - depending on that, you need to add the test to fast or slow list in
> ptest-packagelists.inc, so it's actually executed in yocto CI.
I'll add it in the slow list in ptest-packagelists.inc, I assume that is OK.

Ravineet
>
> Alex
>
> On Wed, 25 Jan 2023 at 14:05, Ravineet Singh <ravineet.a.singh@est.tech> wrote:
> >
> > Step 1 of adding gnutls unit-tests into ptest. Only self-contained
> > test (no external file system dependencies) are included in this step.
> >
> > Sample output:
> > root@qemux86-64:~# ptest-runner gnutls
> > START: ptest-runner
> > BEGIN: /usr/lib64/gnutls/ptest
> > PASS: aead-cipher-vec
> > PASS: alerts
> > PASS: anti_replay
> > ...
> > gnutls test summary:
> > --------------------
> > total: 375
> > pass : 364
> > fail : 0
> > skip : 11
> >
> > DURATION: 184
> > END: /usr/lib64/gnutls/ptest
> > 2023-01-13T11:32
> > STOP: ptest-runner
> > TOTAL: 1 FAIL: 0
> >
> > Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
> > ---
> >  .../gnutls/gnutls/Add-ptest-support.patch     | 59 ++++++++++++
> >  meta/recipes-support/gnutls/gnutls/run-ptest  | 90 +++++++++++++++++++
> >  meta/recipes-support/gnutls/gnutls_3.7.8.bb   |  8 +-
> >  3 files changed, 156 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> >  create mode 100644 meta/recipes-support/gnutls/gnutls/run-ptest
> >
> > diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> > new file mode 100644
> > index 0000000000..965568cfd6
> > --- /dev/null
> > +++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> > @@ -0,0 +1,59 @@
> > +From 74080376904713a8e6cceefbc25c81512796bf0c Mon Sep 17 00:00:00 2001
> > +From: Ravineet Singh <ravineet.a.singh@est.tech>
> > +Date: Tue, 10 Jan 2023 16:11:10 +0100
> > +Subject: [PATCH] gnutls: add ptest support
> > +
> > +Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
> > +---
> > + Makefile.am       | 3 +++
> > + configure.ac      | 2 ++
> > + tests/Makefile.am | 6 ++++++
> > + 3 files changed, 11 insertions(+)
> > +
> > +diff --git a/Makefile.am b/Makefile.am
> > +index 843193f9f..816b09fec 100644
> > +--- a/Makefile.am
> > ++++ b/Makefile.am
> > +@@ -191,6 +191,9 @@ dist-hook:
> > +       mv ChangeLog $(distdir)
> > +       touch -c $(distdir)/doc/*.html $(distdir)/doc/*.pdf $(distdir)/doc/*.info
> > +
> > ++install-ptest:
> > ++       $(MAKE) -C tests DESTDIR=$(DESTDIR)/tests $@
> > ++
> > + .PHONY: abi-check abi-dump-versioned abi-dump-latest pic-check symbol-check local-code-coverage-output files-update AUTHORS
> > +
> > + include $(top_srcdir)/cligen/cligen.mk
> > +diff --git a/configure.ac b/configure.ac
> > +index baff1c007..f9f596abf 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -1150,6 +1150,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
> > +
> > + AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" = "yes")
> > +
> > ++AM_EXTRA_RECURSIVE_TARGETS([buildtest-TESTS])
> > ++
> > + AC_DEFINE([GNUTLS_INTERNAL_BUILD], 1, [We allow temporarily usage of deprecated functions - until they are removed.])
> > +
> > + hw_features=
> > +diff --git a/tests/Makefile.am b/tests/Makefile.am
> > +index 573e911a0..e8a26f8b9 100644
> > +--- a/tests/Makefile.am
> > ++++ b/tests/Makefile.am
> > +@@ -644,6 +644,12 @@ SH_LOG_COMPILER = $(SHELL)
> > + AM_VALGRINDFLAGS = --suppressions=$(srcdir)/suppressions.valgrind
> > + LOG_COMPILER = $(LOG_VALGRIND)
> > +
> > ++install-ptest: $(check_PROGRAMS)
> > ++      @$(INSTALL) -d $(DESTDIR)
> > ++      @for file in $^; do \
> > ++              $(INSTALL_PROGRAM) $$file $(DESTDIR) ; \
> > ++      done
> > ++
> > + distclean-local:
> > +       rm -rf softhsm-*.db softhsm-*.config *.tmp tmp-* x509-crt-list-import-url.config.db port.lock.d
> > +
> > +--
> > +2.31.1
> > +
> > diff --git a/meta/recipes-support/gnutls/gnutls/run-ptest b/meta/recipes-support/gnutls/gnutls/run-ptest
> > new file mode 100644
> > index 0000000000..84948f487d
> > --- /dev/null
> > +++ b/meta/recipes-support/gnutls/gnutls/run-ptest
> > @@ -0,0 +1,90 @@
> > +#!/bin/sh
> > +
> > +rjob() {
> > +    local job=$1
> > +    local log=$2
> > +
> > +    # TODO: Output will be garbled
> > +    ./${job} >> ${log} 2>&1
> > +
> > +    ret=$?
> > +    case $ret in
> > +    0)
> > +        echo "PASS: $t" >> ${log}
> > +        echo "PASS: $t"
> > +        ;;
> > +    77)
> > +        echo "SKIP: $t" >> ${log}
> > +        echo "SKIP: $t"
> > +        ;;
> > +    *)
> > +        echo "FAIL: $t" >> ${log}
> > +        echo "FAIL: $t"
> > +        ;;
> > +    esac
> > +}
> > +
> > +is_disallowed() {
> > +    local key=$1
> > +    $(echo ${test_disallowlist} | grep -w -q ${key})
> > +    return $?
> > +}
> > +
> > +# TODO
> > +# This list should probably be in a external file
> > +# Testcases defined here either take very long time (dtls-stress)
> > +# or are dependent on local files (certs, etc) in local file system
> > +# currently not exported to target.
> > +
> > +test_disallowlist=""
> > +test_disallowlist="${test_disallowlist} dtls-stress"
> > +test_disallowlist="${test_disallowlist} handshake-large-cert"
> > +test_disallowlist="${test_disallowlist} id-on-xmppAddr"
> > +test_disallowlist="${test_disallowlist} mini-x509-cas"
> > +test_disallowlist="${test_disallowlist} pkcs12_simple"
> > +test_disallowlist="${test_disallowlist} protocol-set-allowlist"
> > +test_disallowlist="${test_disallowlist} psk-file"
> > +test_disallowlist="${test_disallowlist} rawpk-api"
> > +test_disallowlist="${test_disallowlist} set_pkcs12_cred"
> > +test_disallowlist="${test_disallowlist} system-override-curves-allowlist"
> > +test_disallowlist="${test_disallowlist} system-override-hash"
> > +test_disallowlist="${test_disallowlist} system-override-sig"
> > +test_disallowlist="${test_disallowlist} system-override-sig-tls"
> > +test_disallowlist="${test_disallowlist} system-prio-file"
> > +test_disallowlist="${test_disallowlist} x509cert-tl"
> > +
> > +LOG=${PWD}/tests.log
> > +cd tests
> > +max_njobs=$(grep -c ^processor /proc/cpuinfo)
> > +njobs=0
> > +
> > +for t in *; do
> > +    [ -x $t ] || continue
> > +    [ -f $t ] || continue
> > +
> > +    is_disallowed ${t}
> > +    [ $? -eq 0 ] && continue
> > +
> > +    rjob ${t} ${LOG} &
> > +    one=1
> > +    njobs=$(expr ${njobs} + ${one})
> > +    if [ ${njobs} -eq ${max_njobs} ]; then
> > +        wait
> > +        njobs=0
> > +    fi
> > +done
> > +wait
> > +
> > +skipped=$(grep -c SKIP ${LOG})
> > +passed=$(grep -c PASS ${LOG})
> > +failed=$(grep -c FAIL ${LOG})
> > +total=$(expr ${passed} + ${failed} + ${skipped})
> > +
> > +echo
> > +echo "gnutls test summary:"
> > +echo "--------------------"
> > +echo "total: ${total}"
> > +echo "pass : ${passed}"
> > +echo "fail : ${failed}"
> > +echo "skip : ${skipped}"
> > +echo
> > diff --git a/meta/recipes-support/gnutls/gnutls_3.7.8.bb b/meta/recipes-support/gnutls/gnutls_3.7.8.bb
> > index 8f979a5b99..fee06393bd 100644
> > --- a/meta/recipes-support/gnutls/gnutls_3.7.8.bb
> > +++ b/meta/recipes-support/gnutls/gnutls_3.7.8.bb
> > @@ -22,11 +22,13 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
> >  SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
> >             file://arm_eabi.patch \
> >             file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
> > +           file://run-ptest \
> > +           file://Add-ptest-support.patch \
> >             "
> >
> >  SRC_URI[sha256sum] = "c58ad39af0670efe6a8aee5e3a8b2331a1200418b64b7c51977fb396d4617114"
> >
> > -inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
> > +inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
> >
> >  PACKAGECONFIG ??= "libidn  ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
> >
> > @@ -68,6 +70,10 @@ do_install:append:class-target() {
> >          fi
> >  }
> >
> > +do_compile:append() {
> > +        oe_runmake ${PARALLEL_MAKE} -C tests buildtest-TESTS
> > +}
> > +
> >  PACKAGES =+ "${PN}-openssl ${PN}-xx ${PN}-fips"
> >
> >  FILES:${PN}-dev += "${bindir}/gnutls-cli-debug"
> > --
> > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#176347): https://lists.openembedded.org/g/openembedded-core/message/176347
> > Mute This Topic: https://lists.openembedded.org/mt/96519581/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

