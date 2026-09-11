Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B862C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 12:13:48 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37885.1789128823850326247
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 05:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UxvRjpzb;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48589798dbbso780849f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 05:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789128822; x=1789733622; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gccsaZLS2vRVNjly0DYVNGToyD85AnFPNyDQjTNz5dg=;
        b=UxvRjpzbj3Dpwxgv+hm0pJILzHfFqWkZraCZ6aFThHsE4Ek9IgxVqkWp0Nh2daQ2CF
         iQwbV9PmRNehyLhIVnqn6rQtmhP8cbSKGa8HbXWi7rc8Lj116UMhIfLDNHg1tjCi96Lv
         ApSvOg3Ber8JKdFr5e0napSOPZ4sksEEUtxRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128822; x=1789733622;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gccsaZLS2vRVNjly0DYVNGToyD85AnFPNyDQjTNz5dg=;
        b=X7VZXZctum9p3P2HuChINeb0cJDcJ+CMut2oRrY0pS0sbepS32lBc7M0R+aqupXaeF
         1qGUaUXNXyu0g6qzOwxvrjTLJzCzLbUylDgroeL47lHXkgLfptYYt8b2HdxDIbJVTDTZ
         rEwKuEXAtY6TdwPTCc08+Zrv12E4LJcqczbfVvJbTjU260JelVNMsJeNKod6yHXCiFkF
         Zuh51crsWLQc5a+PwxpUP6o4T5UBRZ2wIXuiv5ZTzCD9PWjPwA32auUnOks8orikXzpP
         Hs3ZH4qPqvdyqQzOTjk6eeRLo2exVEeEfvEz7t1ZwWymJmAJXRAIwxQz4bnNs0dXjHfK
         K+yg==
X-Forwarded-Encrypted: i=1; AKwUvBwFLRqHlpraobyL03M1O/kloXsJU3AuaKcPxIRcePqzTp1W+RXxR6m31ZpuM/kDgG5oNVCA4WLfBSgKa+p64XJQpg==@lists.openembedded.org
X-Gm-Message-State: AFuF++mW1UGr5OHvCrvdm8a3IT1vqdsD2BUUntfMIMs01y/HgFIgTSrk
	Q7q7YP8hQJhsKYAIvQN0vaI1gbn3XcwsLfKbJ6kaA31OdsYoiX1r+v7RaJMSlhYII+4=
X-Gm-Gg: AYBFou2lTuRsFVFsMAnlges1CVmWMLzJ9tn8oI3lL2i5tTbTfUUCx3gjT59ZIGMuF1+
	hXYFpTVRi/FKzV/llKQfwrGbNHPr/H7dvJfQb0Jco2Q8/rC8R5YtemPUc6sDewNSP97NiSlRX/o
	1MQKerpDLfJmM9mG9SN3a5FgNrZ3DC/P8FrTgcZgcMMYGTBVD+X/f5JzTG/9X8x8guPbTg0MJ5W
	6RgZfhHmlWQS1QX5PGkFL2Lx+Aw4D8TwPD2UUFL7NI37lAUoThm2d6iin7hgA6fjWRWO04e4q2P
	CTWuJxLVz7lYsoV70f9f8vEj3VKESL3H1Gne/KJem4VoI32csK08xsu14s2CAQwVBx/RYVflrMN
	YfD6hMG8XRG8pHlrpfv7v7fuU/MXOueJBvXXEfRTWMWQk0NNhyU3gv11qC2+3OqVskBaI6gvK0E
	hy9OIFeG0Mt/NfI4Wuc2fvzv0V/M4AO44Iwcep1TpHkYlQdSaU29ky7lGkCOuJa82VudSDY01lw
	lY/4A5OrWmZyiD6igINbV4CNPfxLVscBrYcwlwHq/ncyCTJCyxIuuy1yqQugUU=
X-Received: by 2002:adf:e001:0:20b0:485:9249:6a10 with SMTP id ffacd0b85a97d-486eb2e3e99mr3235377f8f.7.1789128821606;
        Fri, 11 Sep 2026 05:13:41 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e6f1sm5488127f8f.6.2026.09.11.05.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 05:13:41 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 14:13:40 +0200
Message-Id: <DLCH8HL0LK4T.1QN4RLK06UCZM@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] perl: fix for CVE-2026-42496
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260907074128.234508-1-hprajapati@mvista.com>
In-Reply-To: <20260907074128.234508-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 12:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245639

On Mon Sep 7, 2026 at 9:41 AM CEST, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Pick patch from [1] also mentioned at NVD report in [2]
>
> [1] https://github.com/jib/archive-tar-new/commit/17c873492a05eddc0de18c1=
485e0b2cccd5a9158
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-42496
> [3] https://security-tracker.debian.org/tracker/CVE-2026-42496
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../perl/files/CVE-2026-42496.patch           | 86 +++++++++++++++++++
>  meta/recipes-devtools/perl/perl_5.38.4.bb     |  1 +
>  2 files changed, 87 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-42496.patch
>
> diff --git a/meta/recipes-devtools/perl/files/CVE-2026-42496.patch b/meta=
/recipes-devtools/perl/files/CVE-2026-42496.patch
> new file mode 100644
> index 0000000000..34d59d9363
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/files/CVE-2026-42496.patch
> @@ -0,0 +1,86 @@
> +From 17c873492a05eddc0de18c1485e0b2cccd5a9158 Mon Sep 17 00:00:00 2001
> +From: Stig Palmquist <stig@stig.io>
> +Date: Thu, 21 May 2026 19:59:21 +0100
> +Subject: [PATCH] Validate symlink and hardlink linkname in SECURE MODE
> +
> +Signed-off-by: Chris 'BinGOs' Williams <chris@bingosnet.co.uk>
> +
> +CVE: CVE-2026-42496
> +Upstream-Status: Backport [https://github.com/jib/archive-tar-new/commit=
/17c873492a05eddc0de18c1485e0b2cccd5a9158]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + cpan/Archive-Tar/lib/Archive/Tar.pm     | 30 +++++++++++++++++++++++++
> + cpan/Archive-Tar/t/04_resolved_issues.t |  2 ++
> + 2 files changed, 32 insertions(+)
> +
> +diff --git a/cpan/Archive-Tar/lib/Archive/Tar.pm b/cpan/Archive-Tar/lib/=
Archive/Tar.pm
> +index 476e646..4c73823 100644
> +--- a/cpan/Archive-Tar/lib/Archive/Tar.pm
> ++++ b/cpan/Archive-Tar/lib/Archive/Tar.pm
> +@@ -944,6 +944,19 @@ sub _make_special_file {
> +     my $err;
> +=20
> +     if( $entry->is_symlink ) {
> ++        if( !$INSECURE_EXTRACT_MODE ) {
> ++            my $linkname =3D $entry->linkname;
> ++            if( File::Spec->file_name_is_absolute($linkname) ) {
> ++                $self->_error( qq[Symlink '] . $entry->full_path .
> ++                    qq[' has absolute target. Not extracting under SECU=
RE EXTRACT MODE] );
> ++                return;
> ++            }
> ++            if( grep { $_ eq '..' } File::Spec->splitdir($linkname) ) {
> ++                $self->_error( qq[Symlink '] . $entry->full_path .
> ++                    qq[' target attempts traversal. Not extracting unde=
r SECURE EXTRACT MODE] );
> ++                return;
> ++            }
> ++        }
> +         my $fail;
> +         if( ON_UNIX ) {
> +             symlink( $entry->linkname, $file ) or $fail++;
> +@@ -957,6 +970,23 @@ sub _make_special_file {
> +                 $entry->linkname .q[' failed] if $fail;
> +=20
> +     } elsif ( $entry->is_hardlink ) {
> ++        if( !$INSECURE_EXTRACT_MODE ) {
> ++            my $linkname =3D $entry->linkname;
> ++            if( File::Spec->file_name_is_absolute($linkname) ) {
> ++                $self->_error( qq[Hardlink '] . $entry->full_path .
> ++                    qq[' has absolute target '$linkname'. Not extractin=
g ] .
> ++                    qq[under SECURE EXTRACT MODE: extraction itself chm=
ods ] .
> ++                    qq[the shared inode.] );
> ++                return;
> ++            }
> ++            if( grep { $_ eq '..' } File::Spec->splitdir($linkname) ) {
> ++                $self->_error( qq[Hardlink '] . $entry->full_path .
> ++                    qq[' target '$linkname' attempts traversal. Not ] .
> ++                    qq[extracting under SECURE EXTRACT MODE: extraction=
 ] .
> ++                    qq[itself chmods the shared inode.] );
> ++                return;
> ++            }
> ++        }
> +         my $fail;
> +         if( ON_UNIX ) {
> +             link( $entry->linkname, $file ) or $fail++;
> +diff --git a/cpan/Archive-Tar/t/04_resolved_issues.t b/cpan/Archive-Tar/=
t/04_resolved_issues.t
> +index fc713cd..593501a 100644
> +--- a/cpan/Archive-Tar/t/04_resolved_issues.t
> ++++ b/cpan/Archive-Tar/t/04_resolved_issues.t
> +@@ -219,6 +219,7 @@ SKIP: {
> + 		}
> +=20
> +     { #use case 1 - in memory extraction

Hello,

> ++	        local $Archive::Tar::INSECURE_EXTRACT_MODE=3D1;

Indentation changed in this line from upstream.
Can you send a v2 without spurious indendation changes?

Thanks!
--=20
Yoann Congal
Smile ECS


