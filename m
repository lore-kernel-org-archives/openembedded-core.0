Return-Path: <christoph.lauer@email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEC8C433EF
	for <webhook@archiver.kernel.org>; Sun, 10 Jul 2022 15:36:54 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by mx.groups.io with SMTP id smtpd.web08.18003.1657467408701823191
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 08:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=GTferMfD;
 spf=pass (domain: email.de, ip: 217.72.192.78,
 mailfrom: christoph.lauer@email.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1657467406;
	bh=Hg8GC1n4JY+fEFSpN22dKalyh7t8oao68j8ntbRb4ek=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=GTferMfDYP7Fp4NADJelE+vEDD/aPvTMZbo3dnvhYdznNTvPvywGDfTxqug5nhBV+
	 qNrKuViTCGkeMx59qEv5B4qur2ysCSithSQjhW2CqOHbqcZZSEbgDBoh3xhaS0YKQp
	 s3LOy0nioijaF0O9yS3sY+b+5QohshC8Hrn7vOAk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from XTR-ACUYOCTO-P01.xtronic-net.com ([178.251.90.190]) by
 smtp.web.de (mrweb106 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MWi9q-1o3quk0rNI-00XM9w; Sun, 10 Jul 2022 17:36:46 +0200
From: Christoph Lauer <christoph.lauer@email.de>
To: openembedded-core@lists.openembedded.org
Cc: Christoph Lauer <christoph.lauer@xtronic.de>
Subject: [PATCH] package.bbclass: Avoid stripping signed kernel modules in
 splitdebuginfo
Date: Sun, 10 Jul 2022 17:36:38 +0200
Message-Id: <20220710153638.61096-1-christoph.lauer@email.de>
X-Mailer: git-send-email 2.17.1
X-Provags-ID: V03:K1:e6pPCjho8tavajd5WTNDg5aNVyJQeOQKbOrcSQXdODtOkz9AykR
 L+HhxLPT1zCZODKxcQSvlBgGpoxY4bxsjmMOjx3TJagJVQegY8jsummlJp8b1FpEsUvB7nW
 AN18IscbJCHQ6VBU87MDu5NNIAAhpUrPVeolwDnUo4O2EgGhte6dXxOMu2dxV1Ve1wHyGvg
 AQwIgLtbSQ1pzhtzLfQYQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yfH9RAxIiD0=:o5QQgpdvJkxNEVYnJIkduB
 e0eZS40j7U0d3HAt2Ah8dAf6olkWpUMTeRZb8zIR3uREPrWUc4XX8hgHCrChCgVSNHDhTVc7+
 akwKvDZPWBHF2mCgkdi+8zHFYVnIpJ8aBgJ/G9+q9vwZkY3QCVxlQIJWl6W6AJzHLbsJCFqmH
 nRGMdQWe/RQgmbRDBuTRO/t8uE7xm+jTzW8KyIhDfx6h4DTfP0I1c8KcM/TuA2fXphprWABi+
 zkaojJSmEbrj/m+5EJ++u1Ya3/qvOcp3m493z/fvGLfJlJqgDYmH8qUjAxB2BVecWCoGrdDjR
 EiDti8EDSwM7hK+bd4xNn8rPDyh6s+HBLZWTkk+gruOWksPJttyfW/xbgB8TzUuUFN0DN9dje
 LmkdaXFst1PF3LxVKF20W1tqn+MTYZ6LZjCKrhQmhWo8vEmkWD0pljgewfDDhPD/kr+MEaQZ4
 DSmP8PpVx40DDGUwwMFrrwsM9V8eXmfE4Yai0P3V5m+1CT7LpyEfqkjqMKg22R8Kjkc2lXg0m
 fNpGDBEjXtyAxnqiGiYccWiv3O76ParIgk2sM7MlBehsoBUqOXCzHEJTlgsylx6YFv+5S8yIm
 3BFpuuQ+k5xILaen9w5FXiV/3GWMQsokQqrnb53JArxXQra6YZhwPwPp6uZHncWpVm3dBaphm
 edmRhIU4lx0do/ODD/WnZdFuFuSkI7pOHiyB0nW2JZClns1SDXHL9yX1iK9IyrATpbG0JsLc+
 mH2dSAN6owpdAXIzhHHiy87HZCp+dhu5ljNk0XSK5VgTRlyg2EYg8hk81qTmHDj2Gi1y3ER5j
 JWAcujfGIHPLFmWhCVN5li/RJJ2CqWcUqTMu+tM9oL9b88PaFhPqNJeTe8q3oghfjG/Qu3HrP
 DTcG5te9R1dJtaKN1sWjGdvwVsdoof8XlCJ8bpXBEreb/W3cIh3NBcPuZWkqUGtrfNWmSxwR9
 rcd5IOtMdCSBTY86/rM+bUHAYmyYw3pZRUeIJdb+QT394o5pXJckcim6PeyaSweem68kcalRs
 cOhfEYGGgAqaghZunsKubLl+QpHkEga7buDMJTIoRK68Unyyt6qimautk57TIwQwBuKPkbx22
 eTTrRgEe5FmYW1FpsbK+FoNX9c/wzcDeq3aqEQtZIcs1pxjILRpKpQhqQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Jul 2022 15:36:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167847

From: Christoph Lauer <christoph.lauer@xtronic.de>

Since commit d756b346f248df47b0540644adb1d0f17bcc4b6e kernel modules are s=
tripped by the functions 'runstrip' and 'splitdebuginfo'. Signed modules m=
ust not be stripped. Function 'runstrip' avoids this by running is_kernel_=
module_signed. Apply the same check to splitdebuginfo.

Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
=2D--
 meta/classes/package.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4850134022..5328c6bc8b 100644
=2D-- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -382,6 +382,10 @@ def splitdebuginfo(file, dvar, dv, d):
     debugfile =3D dvar + dest
     sources =3D []

+    if oe.package.is_kernel_module_signed(file):
+        bb.debug(1, "Skip strip on signed module %s" % file)
+        return (file, sources)
+
     # Split the file...
     bb.utils.mkdirhier(os.path.dirname(debugfile))
     #bb.note("Split %s -> %s" % (file, debugfile))
=2D-
2.17.1


