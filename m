Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116BFC982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 21:13:03 +0000 (UTC)
Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42738.1789659646079058085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 08:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=oiKwf+/n;
 spf=pass (domain: baylibre.com, ip: 74.125.230.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-90cdfcbe207so9925756d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 08:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789659645; x=1790264445; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yh7pCc8Tr6vnfm80joedj2xy+61aRzzCx1i1elLG9sE=;
        b=oiKwf+/nolTTgpVkw3jZ/Z/FL/90vlCusFxK/SwaRimET6SIyE8tWBvgQMC7rxf9BF
         wIf8k2F0j8LKvvnq/2tmsp9904VO2Aip6zWN4oJeuUUK0GVDojZ4kXFIPKBK2k7yjsJ0
         9DnAv7pbBGUIHoMrrzTyDaolJTMC9jE295mX2DznK96rFjnPZVQ0o8hPpPWqYXFDguTd
         wtJ3OL0CTwNuotje+PF6P6oYx4bjRaS9SgC8hDaLVAC9dyPh4UaGTqOwrGn90k9ifIL2
         Af6Ie1GjjPQVcTHXbLlsnCUomV0TBHdHvKfc6UUh2g5X9F54oB5KvlSrr2Ipb1ClonGn
         T9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659645; x=1790264445;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yh7pCc8Tr6vnfm80joedj2xy+61aRzzCx1i1elLG9sE=;
        b=D7h88o0hZEe8MHsHY9IHvpOEXxhqU1WEhFVJhZQERF3+CPZZeRPqOwsIzR4im2e9Wv
         ygBNGlDHRnNVPnbp4daDJC5KkYl151cXe4CswOZJv+DuMIEd6eJqQNloMAaxPEngSAW4
         0k2DZxnOv5prNzFyhGJ+brycfSpiILvrPWyxcuPszluTpyBG6kgMZ1+nBWfPrdUfhlEV
         tjO6lo7XV2uoVA3w0+2yEsrmhgzUo7zlkc2RMXX8ntn6WNsL4ihTv1IGVDAHae7hnNRW
         cTi7d6VQUKUc4ycCuznC+2WC6onZKXAd3gn7YkgdBe+XQwDgpDzbXYJ7wgUpJwxKk6kz
         M/MA==
X-Forwarded-Encrypted: i=1; AKwUvBx2E8wsUz3Ll9bcLjf2frFuIzO3TsNdY4WKfof93/hKKvvlaQzF7WDe4sik3wH2SwrsYeP5v5iT5iNyjCOE/N/eVA==@lists.openembedded.org
X-Gm-Message-State: AFuF++l9JHDoi6svn/0g8bOyEeUHIaQmHkH8MQrIMf0v6AMTmfedAtyl
	8rGLxeO0FzdX8K3QfsUdCk0uJwmAD8Q+CcOX5qc1eCtsdu35oa/Cpq3ZXUXcKNQ1CMfVbqPO21w
	RXeln
X-Gm-Gg: AYBFou19RFfnznc8GoI54PIKIVsKcG+lALjp+m4AZ+JQ6aa21QnaBHNxP/ZSlMfZpdV
	X2LGze7+otBImYopp0O+VH7Vg4yxBGlkBU9AaqtRlL94A3TeoojtMFgF5855Rc1CI2WywjOB5iK
	FS4HgI6wlI+iyvp0JAKx9xVTUhr6d1KBj2AZoEdoiF06SrDD6/loYT8Ix8LcRX7qaKEKo4RJQcn
	p3GW6KRS1v1vUp3UDPysJkk1P5EQ4ebqq489LFGaGqdeUWHzMxtqwyLpiC2dBtipLoib3BcT6iw
	il32LKRSRPvfV5mj0YEax3HX1XZSgYd5aeN1+pos7iv9R3fhw+LFtN7sryU7K0yKBlgZEG9ljYf
	aNNfV/wz4l17FBXxosrJ+3mqap6YU6xjvSQJVrUMSJ0RRpdlmGexufSIPANhdE1PJBUacE9UuYS
	pQW6aufQOTn2INSpR5YGVRq/JHH6cbvgaxlUXXCWeznGt2Bm9WwHMFyAItukyX4CqLE3dSLSegV
	rgro2HlODiqt6VCotiqaSkl/RQprFWcYw==
X-Received: by 2002:a05:6214:627:b0:910:3453:505d with SMTP id 6a1803df08f44-9125244dac8mr6973826d6.31.1789659644719;
        Thu, 17 Sep 2026 08:40:44 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252c9377esm612766d6.24.2026.09.17.08.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 08:40:44 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 17 Sep 2026 11:40:42 -0400
Message-Id: <DLHPE9Y2I92C.377RLG9OUQJQS@baylibre.com>
Cc: <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] util-linux: ptest: fix flock test timeout on slow targets
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20260917144042.10045-1-pratik.farkase@est.tech>
In-Reply-To: <20260917144042.10045-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 21:13:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246089

On Thu Sep 17, 2026 at 10:40 AM EDT, Pratik Farkase wrote:
> The flock ptest starts flock in the background and waits only 1 second
> (hardcoded "timeout 1s") for flock to spawn its child, polling with
> "pgrep -P". That budget only covers process startup, so it depends on
> host speed. Under emulation (qemuriscv64 under TCG) spawning bash and
> flock can exceed 1s, so the child is not seen in time and the test
> aborts with "timeout waiting for flock child", failing intermittently on
> the autobuilder.
>
> Backport a test fix that raises the timeout to 30s. The poll loop exits
> as soon as the child appears, so fast hosts are unaffected; it only adds
> headroom on slow/emulated targets.
>
> [YOCTO #16425]

Thanks for this. Hopefully, upstream takes the patch. Out of curiosity, why=
 did
you choose 30s? Did you test with shorter timeouts (e.g. 10s)?

Trevor
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---
>  meta/recipes-core/util-linux/util-linux.inc   |  1 +
>  ...ncrease-wait-for-flock-child-timeout.patch | 38 +++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-core/util-linux/util-linux/0001-tests-fl=
ock-increase-wait-for-flock-child-timeout.patch
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index b30fb04e05..249ae09545 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -23,6 +23,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux=
/v${MAJOR_VERSION}/util-lin
>             file://0004-libmount-use-USE_LIBMOUNT_MOUNTFD_SUPPORT-for-idm=
ap-h.patch \
>             file://0005-tools-add-non-newmount.conf-config-gen-profile.pa=
tch \
>             file://0006-tests-lsfd-accept-rw-mode-for-mmap-ed-packet-sock=
et-.patch \
> +           file://0001-tests-flock-increase-wait-for-flock-child-timeout=
.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "66ac7c0e725278eb2b039e3104f2c91119341d941b41bac7=
a285c695f940bd57"
> diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-flock-inc=
rease-wait-for-flock-child-timeout.patch b/meta/recipes-core/util-linux/uti=
l-linux/0001-tests-flock-increase-wait-for-flock-child-timeout.patch
> new file mode 100644
> index 0000000000..60b6c86eeb
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/0001-tests-flock-increase-w=
ait-for-flock-child-timeout.patch
> @@ -0,0 +1,38 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Pratik Farkase <pratik.farkase@est.tech>
> +Date: Wed, 17 Sep 2026 12:00:00 +0000
> +Subject: [PATCH] tests: flock: increase "wait for flock child" timeout
> +
> +The flock test launches "flock ... bash -c '... sleep 3 ...'" in the
> +background and then waits for flock to spawn its child using a hardcoded
> +"timeout 1s" around a pgrep poll loop. That 1 second only covers process
> +startup, so it is purely a function of host speed. Under emulation (e.g.
> +qemuriscv64 under TCG) spawning the shell and flock can exceed 1s, so
> +pgrep does not see the child in time and the test aborts with "timeout
> +waiting for flock child", failing intermittently.
> +
> +Increase the timeout to 30s. The loop exits as soon as the child
> +appears, so this does not slow down fast hosts; it only adds headroom on
> +slow/emulated targets.
> +
> +Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pul=
l/4639]
> +
> +Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> +---
> + tests/ts/flock/flock | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tests/ts/flock/flock b/tests/ts/flock/flock
> +--- a/tests/ts/flock/flock
> ++++ b/tests/ts/flock/flock
> +@@ -65,7 +65,7 @@
> + 		ts_die "unable to run flock"
> + 	fi
> + 	# the lock should be established when flock has a child
> +-	timeout 1s bash -c "while ! pgrep -P $pid >/dev/null; do sleep 0.1 ;do=
ne" \
> ++	timeout 30s bash -c "while ! pgrep -P $pid >/dev/null; do sleep 0.1 ;d=
one" \
> + 		|| ts_die "timeout waiting for flock child"
> +=20
> + 	ts_init_subtest "${subtest_prefix}non-block"
> +--
> +2.43.0



