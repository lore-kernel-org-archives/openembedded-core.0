Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0BECCD1AB
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 06:33:08 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.3423.1761287579639253922
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 23:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vBypqDrD;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BF8961A1633;
	Fri, 24 Oct 2025 06:32:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A44760703;
	Fri, 24 Oct 2025 06:32:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39960102F244A;
	Fri, 24 Oct 2025 08:32:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761287577; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7eZGPaJzWPUKOiZ0SNWw7XOMghGnDEXATQS18m7w0MM=;
	b=vBypqDrDE1ovLDk0MCT4aQyXR6imaYSuDGwodHVtVoh0+OCQ8g6BaHmtiI3Qoyoe+Tw+4E
	GFPebEb84gO61KivyPUshSQqRWbq4CnInvZZskoeT3zZUOL+cAAyq0xrVWKcgizv7xCC8J
	qO5E9EcPTAHWh9MhXTiaoNsHoa/+DLi2+b+DkcGb0pNqOW6i25CW6RpAuKrh+X7honiHdV
	31YuuhG657x64KBs95xO0SAhxmStD3MjJms0yjqKl7RX+H3XAIItUl9M7PW+27rrEI/LKI
	1UE5bi+A6GZ12Rhuk3WzPSNNYbq4sRNVz/Mbx6xJQl1wDd69ulRwr1UXWHHCww==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Oct 2025 08:32:53 +0200
Message-Id: <DDQCC5ASH6VD.3LTKDQYDDCFKP@bootlin.com>
To: <yoann.congal@smile.fr>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] selftest/bblayers: Refactor JSON schema
 validation
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251023072513.280477-1-yoann.congal@smile.fr>
 <20251023072513.280477-2-yoann.congal@smile.fr>
In-Reply-To: <20251023072513.280477-2-yoann.congal@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 06:33:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225282

On Thu Oct 23, 2025 at 9:25 AM CEST, Yoann Congal via lists.openembedded.or=
g wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
>
> * Extract a function "validate_json"
> * Allow to specify the schema relative to $COREBASE/meta/files/
> * Specify the Base URI to allow schema to reference each other
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
> RFC: Maybe I should split this commit?
> ---
>  meta/lib/oeqa/selftest/cases/bblayers.py | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/sel=
ftest/cases/bblayers.py
> index 982287c9a5..43a158fcf2 100644
> --- a/meta/lib/oeqa/selftest/cases/bblayers.py
> +++ b/meta/lib/oeqa/selftest/cases/bblayers.py
> @@ -136,15 +136,24 @@ class BitbakeLayers(OESelftestTestCase):
>          self.assertTrue(os.path.isfile(recipe_file), msg =3D "Can't find=
 recipe file for %s" % recipe)
>          return os.path.basename(recipe_file)
> =20
> -    def validate_layersjson(self, json):
> -        python =3D os.path.join(get_bb_var('STAGING_BINDIR', 'python3-js=
onschema-native'), 'nativepython3')
> -        jsonvalidator =3D os.path.join(get_bb_var('STAGING_BINDIR', 'pyt=
hon3-jsonschema-native'), 'jsonschema')
> -        jsonschema =3D os.path.join(get_bb_var('COREBASE'), 'meta/files/=
layers.schema.json')
> -        result =3D runCmd("{} {} -i {} {}".format(python, jsonvalidator,=
 json, jsonschema))
> +    def validate_json(self, json, jsonschema):
> +        staging_bindir =3D get_bb_var('STAGING_BINDIR', 'python3-jsonsch=
ema-native')
> +        python =3D os.path.join(staging_bindir, 'nativepython3')
> +        jsonvalidator =3D os.path.join(staging_bindir, 'jsonschema')
> +        schemas_dir =3D os.path.join(get_bb_var('COREBASE'), "meta/files=
/")
> +        if not os.path.isabs(jsonschema):
> +            jsonschema =3D os.path.join(schemas_dir, jsonschema)
> +
> +        result =3D runCmd(
> +            "{} {} -i {} --base-uri file://{}/ {}".format(
> +                python, jsonvalidator, json, schemas_dir, jsonschema
> +            )
> +        )
> =20
>      def test_validate_examplelayersjson(self):
>          json =3D os.path.join(get_bb_var('COREBASE'), "meta/files/layers=
.example.json")
> -        self.validate_layersjson(json)
> +        jsonschema =3D "layers.schema.json"
> +        self.validate_json(json, jsonschema)

Hi Yoann,

Did you forget to replace some uses of validate_layersjson() or did I
miss a commit? I still have 5 calls to it in bblayers.py, after your
patches are applied.

2025-10-23 14:30:16,772 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/bblayers.py", line 175, in test_bit=
bakelayers_setup
    self.validate_layersjson(jsonfile)
    ^^^^^^^^^^^^^^^^^^^^^^^^
AttributeError: 'BitbakeLayers' object has no attribute 'validate_layersjso=
n'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2499
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2589
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2737

I had a quick look at the v2 and I believe we have the same issue.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


