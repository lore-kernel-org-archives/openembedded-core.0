Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD72EE20B3
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 15:59:04 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.484.1770393543742005522
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 07:59:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XeAyEwFi;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-649d200ac43so1926053d50.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 07:59:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770393543; cv=none;
        d=google.com; s=arc-20240605;
        b=Yvpsfgh2MsFbvzB8AX8t/vPc2k+fbRtk60Z3QUxtL/6Tw+1CUHHliAbWFf73NUbpY3
         PBK6uf+fL8PVtogX1MsUXNrDqPF0IK8LnqXAXDQp/U4We81MXrwianQ3baRlQJxXEJKF
         41EdtK5BPENhNkMXua9tsuA+64WsJDrZdlQQH1TAhzlLjst6nVd6AkF9hlBmAWBC/ejG
         CEGnGtbicuR0BkeoA5KEggVmsMjd/9aiqBR0ytjy49kDbEIYHBRhtm1EHGsZbSjIDWw0
         U6q62r88s69hLc3u9lfFRylVXBVACkV6LSr0ORf/cWtAHl1xJXMksW8u+TsD+4Ytel5K
         M+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G+rJbc3LOOSbVoqHzGCXMRL1eaMFjXaaWnY20UrUNXM=;
        fh=Ab5QchtAs08eZNSFiBl6MfJNprT6k/vVQ8w3IX57Q1U=;
        b=B6w4ErfM/lfxV0UzXLbwmBCptj6ayRKU94cSwqK460IC6pMfximE5zvK7YhgHLQ5ta
         Fwkh99JiOM/tpJWlD3R67qvI68marPs9KkGE3pfoTgBBNawJ9RKAt+VAW/zLHt7immpv
         UFzHGiy6ASVctImlEo/H0GRWwntRT+6WPbQkWHeXoMFcfv8C7zZ+UXdkWSfjLe4nLgpH
         Vz5C+ffoZk+wxhpfeYgLFoC/O3qDdf3H33bNd3jMNrHT+slOao8CKD7SIq9SB4wpc6Wv
         M7nQKRpw64TZs4TflBZmJ2Jf50BGSr3wKsYI4FIJCV7oNsF+9hHQTmFKqr1OkNaG6O6u
         dbBw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770393543; x=1770998343; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+rJbc3LOOSbVoqHzGCXMRL1eaMFjXaaWnY20UrUNXM=;
        b=XeAyEwFiBvuShlTGcPAdrxa7AORL1CwsN5+e1399R5R/Kp7wrPcHrRY4IbnmezYXZT
         QfM6F/pQvCq5i68qRKzqp4kFSE+dM3ZQDhyb2MdJwFL3nCKKBWGXkCjZo+w2X+Mo7eFY
         /5HkWoN2Ig8ZDwbFj6qKOz+DGdBUzHdbvHbzZiZ29ifCQ1p10mn5jk1v5aUGOMUNg1nO
         /c1pT3c4a+bPAFQqnZYqbBo+AahMg/K8A97e9btLhH5/8q/DjLnea+Hf9Fie+cCaBIoe
         0yYlAdv3t8HuQTFGzXXDHl9fBlHyKeaz32wGde/zHmI2hTslIHww5nfftWttGehUZUrp
         xLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770393543; x=1770998343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G+rJbc3LOOSbVoqHzGCXMRL1eaMFjXaaWnY20UrUNXM=;
        b=mN3qXnaHAv2jouihSOBXOAhhT2aEtR7rAMr3wDujlvO1jJ1ze1kpoMxLBQFAptsWKr
         dIilqChnHVEil8BVNdOcsEns3Av6AZlkQ8ehySf1c8n9YQumA34kc01eXiQF7m3Bk8EO
         l4AOXaVnjx3j8kHQqZnsfQ7HMaeNUjrYNSmF7rKKUKDktYMcqgdRLNs0JM1s3baKcoIU
         gUo2KfnY9ZbUUXIKkvnWBXxN/wugY3ZgfPpdDRyWX40dtO0Wv2awVUXdfzXSwk4/E0VS
         R1qjelTgKhvZ6FF4fcis1Mwk02s9qVM1v9pfHKwKmb/70bVtfGcaE7RE+ceeGPZDINkM
         XUIw==
X-Gm-Message-State: AOJu0YwQgLbXxyuIPKCwJwPTm5nE19/6773PAdL+DJ050TkQxwSeJIgW
	9AMLfeBpIskOmaWjbIQDy8Jw+PdppPb9N7IxX1nl6b2Hi8csWDA5ZLJoISAuE4dzE94X3TZF1k8
	QzFT0GRTRDiJCN74Gb9tCJnV6jYe8lN4=
X-Gm-Gg: AZuq6aKGR7fkkVSR19DJl8zzh8zSAQhceDAeJjBeE1cL7skztsg/YRmqZwHq4nx+QQF
	p86Ocdaen9X6k3C5czg1pYQ2eZiQZScPgEBSYzdZmvNLdfH1EyisD1ZKmtnlGWJGXR7evbjAo47
	N5Yi1R1Yeqae5npDsKsL1gnn/kYpdnuaYkINyiYV09TW2wIFy334NvS+8vsM7JRvwNa11aLuGxv
	E2JDl79LmKqKgIq5OtE8O0h5zJZDU4PAEFBgyxVxovbnMjK5ajTReXYyHKWl5M8/Tq0vTirMAtT
	F2EXUSQy
X-Received: by 2002:a05:690e:2504:20b0:649:cbe3:d2cd with SMTP id
 956f58d0204a3-649f1f54ccamr2512679d50.52.1770393542701; Fri, 06 Feb 2026
 07:59:02 -0800 (PST)
MIME-Version: 1.0
References: <20260206145716.1615377-1-ross.burton@arm.com> <20260206145716.1615377-3-ross.burton@arm.com>
In-Reply-To: <20260206145716.1615377-3-ross.burton@arm.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 6 Feb 2026 08:58:50 -0700
X-Gm-Features: AZwV_QjMENBCBO1S2R7b6_2szl6FevZ1ZzwkCwuakq0TiVSdFSPPGRsvs1WBxuo
Message-ID: <CAJdd5GYbS=spXisRtqasBuJpQp-b2rr81QrWfT7AXeYn+xAZ4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] jquery: remove recipe
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 15:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230628

LGTM

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Fri, Feb 6, 2026 at 7:57=E2=80=AFAM Ross Burton via lists.openembedded.o=
rg
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> Now that the reproducible selftest doesn't use this recipe, it is no
> longer used by any recipes that I can find.
>
> There is an alternative jquery recipe in meta-oe that is slightly
> different and has packaging consistent with with javascript recipes in
> the same layer.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/conf/distro/include/maintainers.inc     |  1 -
>  meta/recipes-devtools/jquery/jquery_3.7.1.bb | 38 --------------------
>  2 files changed, 39 deletions(-)
>  delete mode 100644 meta/recipes-devtools/jquery/jquery_3.7.1.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index b231daf485..28c3e987c9 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -301,7 +301,6 @@ RECIPE_MAINTAINER:pn-iw =3D "Unassigned <unassigned@y=
octoproject.org>"
>  RECIPE_MAINTAINER:pn-libjpeg-turbo =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
>  RECIPE_MAINTAINER:pn-json-c =3D "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-json-glib =3D "Yi Zhao <yi.zhao@windriver.com>"
> -RECIPE_MAINTAINER:pn-jquery =3D "Joshua Watt <JPEWhacker@gmail.com>"
>  RECIPE_MAINTAINER:pn-kbd =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-kea =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-kern-tools-native =3D "Bruce Ashfield <bruce.ashfie=
ld@gmail.com>"
> diff --git a/meta/recipes-devtools/jquery/jquery_3.7.1.bb b/meta/recipes-=
devtools/jquery/jquery_3.7.1.bb
> deleted file mode 100644
> index 33147b493c..0000000000
> --- a/meta/recipes-devtools/jquery/jquery_3.7.1.bb
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -SUMMARY =3D "jQuery is a fast, small, and feature-rich JavaScript librar=
y"
> -HOMEPAGE =3D "https://jquery.com/"
> -DESCRIPTION =3D "${SUMMARY}"
> -LICENSE =3D "MIT"
> -SECTION =3D "devel"
> -LIC_FILES_CHKSUM =3D "file://${S}/${BP}.js;beginline=3D5;endline=3D7;md5=
=3D9c7c6e9ab275fc1e0d99cb7180ecd14c"
> -
> -# unpack items to ${S} so the archiver can see them
> -#
> -SRC_URI =3D "\
> -    https://code.jquery.com/${BP}.js;name=3Djs;subdir=3D${BP} \
> -    https://code.jquery.com/${BP}.min.js;name=3Dmin;subdir=3D${BP} \
> -    https://code.jquery.com/${BP}.min.map;name=3Dmap;subdir=3D${BP} \
> -    "
> -
> -SRC_URI[js.sha256sum] =3D "78a85aca2f0b110c29e0d2b137e09f0a1fb7a8e554b49=
9f740d6744dc8962cfe"
> -SRC_URI[min.sha256sum] =3D "fc9a93dd241f6b045cbff0481cf4e1901becd0e12fb4=
5166a8f17f95823f0b1a"
> -SRC_URI[map.sha256sum] =3D "5e7d6d9c28b7f21006535e8875eb47e9667852a14c46=
24eed301c6cea19ae62b"
> -
> -UPSTREAM_CHECK_REGEX =3D "jquery-(?P<pver>\d+(\.\d+)+)\.js"
> -
> -# https://github.com/jquery/jquery/issues/3927
> -CVE_STATUS[CVE-2007-2379] =3D "upstream-wontfix: There are ways jquery c=
an expose security issues but any issues \
> -are in the apps exposing them and there is little we can directly do."
> -
> -inherit allarch
> -
> -do_install() {
> -    install -d ${D}${datadir}/javascript/${BPN}/
> -    install -m 644 ${S}/${BP}.js ${D}${datadir}/javascript/${BPN}/${BPN}=
.js
> -    install -m 644 ${S}/${BP}.min.js ${D}${datadir}/javascript/${BPN}/${=
BPN}.min.js
> -    install -m 644 ${S}/${BP}.min.map ${D}${datadir}/javascript/${BPN}/$=
{BPN}.min.map
> -}
> -
> -PACKAGES =3D "${PN}"
> -FILES:${PN} =3D "${datadir}"
> -
> -BBCLASSEXTEND +=3D "native nativesdk"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230625): https://lists.openembedded.org/g/openembedde=
d-core/message/230625
> Mute This Topic: https://lists.openembedded.org/mt/117672279/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

