Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B7DC0502A
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 02:54:26 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.55592.1661655263846706458
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 19:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.196, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpclient.apple (unknown [50.34.64.238])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id DC640E0003;
	Sun, 28 Aug 2022 02:54:19 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [OE-core] [meta][dunfell][PATCH] libxml2: Add fix for
 CVE-2016-3709
From: Robert Joslyn <robert.joslyn@redrectangle.org>
In-Reply-To: <20220824115340.17653-1-badganchipv@gmail.com>
Date: Sat, 27 Aug 2022 19:54:17 -0700
Cc: openembedded-core@lists.openembedded.org,
 ranjitsinh.rathod@kpit.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <B519F260-0EBF-4972-9C42-9C182590BD8C@redrectangle.org>
References: <20220824115340.17653-1-badganchipv@gmail.com>
To: Pawan Badganchi <badganchipv@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Aug 2022 02:54:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169976



> On Aug 24, 2022, at 4:53 AM, Pawan Badganchi <badganchipv@gmail.com> =
wrote:
>=20
> From: Pawan Badganchi <badganchipv@gmail.com>
>=20
> Add below patch to fix CVE-2016-3709
>=20
> CVE-2016-3709.patch
> Link: =
https://github.com/GNOME/libxml2/commit/c1ba6f54d32b707ca6d91cb3257ce9de82=
876b6f
>=20
> Signed-off-by: Pawan Badganchi<badganchipv@gmail.com>
> ---
> .../libxml/libxml2/CVE-2016-3709.patch        | 89 +++++++++++++++++++
> meta/recipes-core/libxml/libxml2_2.9.10.bb    |  2 +-
> 2 files changed, 90 insertions(+), 1 deletion(-)
> create mode 100644 =
meta/recipes-core/libxml/libxml2/CVE-2016-3709.patch
>=20
> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2016-3709.patch =
b/meta/recipes-core/libxml/libxml2/CVE-2016-3709.patch
> new file mode 100644
> index 0000000000..5301d05323
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/CVE-2016-3709.patch
> @@ -0,0 +1,89 @@
> +=46rom c1ba6f54d32b707ca6d91cb3257ce9de82876b6f Mon Sep 17 00:00:00 =
2001
> +From: Nick Wellnhofer <wellnhofer@aevum.de>
> +Date: Sat, 15 Aug 2020 18:32:29 +0200
> +Subject: [PATCH] Revert "Do not URI escape in server side includes"
> +
> +This reverts commit 960f0e275616cadc29671a218d7fb9b69eb35588.
> +
> +This commit introduced
> +
> +- an infinite loop, found by OSS-Fuzz, which could be easily fixed.
> +- an algorithm with quadratic runtime
> +- a security issue, see
> +  https://bugzilla.gnome.org/show_bug.cgi?id=3D769760
> +
> +A better approach is to add an option not to escape URLs at all
> +which libxml2 should have possibly done in the first place.
> +
> +CVE: CVE-2016-3709
> +Upstream-Status: Backport =
[https://github.com/GNOME/libxml2/commit/c1ba6f54d32b707ca6d91cb3257ce9de8=
2876b6f]
> +Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
> +---
> + HTMLtree.c | 49 +++++++++++--------------------------------------
> + 1 file changed, 11 insertions(+), 38 deletions(-)
> +
> +diff --git a/HTMLtree.c b/HTMLtree.c
> +index 8d236bb35..cdb7f86a6 100644
> +--- a/HTMLtree.c
> ++++ b/HTMLtree.c
> +@@ -706,49 +706,22 @@ htmlAttrDumpOutput(xmlOutputBufferPtr buf, =
xmlDocPtr doc, xmlAttrPtr cur,
> + 		 (!xmlStrcasecmp(cur->name, BAD_CAST "src")) ||
> + 		 ((!xmlStrcasecmp(cur->name, BAD_CAST "name")) &&
> + 		  (!xmlStrcasecmp(cur->parent->name, BAD_CAST "a"))))) {
> ++		xmlChar *escaped;
> + 		xmlChar *tmp =3D value;
> +-		/* xmlURIEscapeStr() escapes '"' so it can be safely =
used. */
> +-		xmlBufCCat(buf->buffer, "\"");
> +
> + 		while (IS_BLANK_CH(*tmp)) tmp++;
> +
> +-		/* URI Escape everything, except server side includes. =
*/
> +-		for ( ; ; ) {
> +-		    xmlChar *escaped;
> +-		    xmlChar endChar;
> +-		    xmlChar *end =3D NULL;
> +-		    xmlChar *start =3D (xmlChar *)xmlStrstr(tmp, =
BAD_CAST "<!--");
> +-		    if (start !=3D NULL) {
> +-			end =3D (xmlChar *)xmlStrstr(tmp, BAD_CAST =
"-->");
> +-			if (end !=3D NULL) {
> +-			    *start =3D '\0';
> +-			}
> +-		    }
> +-
> +-		    /* Escape the whole string, or until start (set to =
'\0'). */
> +-		    escaped =3D xmlURIEscapeStr(tmp, =
BAD_CAST"@/:=3D?;#%&,+");
> +-		    if (escaped !=3D NULL) {
> +-		        xmlBufCat(buf->buffer, escaped);
> +-		        xmlFree(escaped);
> +-		    } else {
> +-		        xmlBufCat(buf->buffer, tmp);
> +-		    }
> +-
> +-		    if (end =3D=3D NULL) { /* Everything has been =
written. */
> +-			break;
> +-		    }
> +-
> +-		    /* Do not escape anything within server side =
includes. */
> +-		    *start =3D '<'; /* Restore the first character of =
"<!--". */
> +-		    end +=3D 3; /* strlen("-->") */
> +-		    endChar =3D *end;
> +-		    *end =3D '\0';
> +-		    xmlBufCat(buf->buffer, start);
> +-		    *end =3D endChar;
> +-		    tmp =3D end;
> ++		/*
> ++		 * the < and > have already been escaped at the entity =
level
> ++		 * And doing so here breaks server side includes
> ++		 */
> ++		escaped =3D xmlURIEscapeStr(tmp, =
BAD_CAST"@/:=3D?;#%&,+<>");
> ++		if (escaped !=3D NULL) {
> ++		    xmlBufWriteQuotedString(buf->buffer, escaped);
> ++		    xmlFree(escaped);
> ++		} else {
> ++		    xmlBufWriteQuotedString(buf->buffer, value);
> + 		}
> +-
> +-		xmlBufCCat(buf->buffer, "\"");
> + 	    } else {
> + 		xmlBufWriteQuotedString(buf->buffer, value);
> + 	    }
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb =
b/meta/recipes-core/libxml/libxml2_2.9.10.bb
> index d1c1f0884f..adeef5bda2 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
> @@ -32,7 +32,7 @@ SRC_URI +=3D =
"http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=3D${BP};name=3Dte
>            file://CVE-2022-23308-fix-regression.patch \
>            file://CVE-2022-29824-dependent.patch \
>            file://CVE-2022-29824.patch \
> -           file://0001-Port-gentest.py-to-Python-3.patch \

Did you intend to remove applying this patch? I assume not, but maybe =
there is something I=E2=80=99m not seeing. If you did intend to remove =
it, the patch file is still in the repo and the commit message doesn=E2=80=
=99t mention why it was removed.

Thanks,
Robert


> +           file://CVE-2016-3709.patch \
>            "
>=20
> SRC_URI[archive.sha256sum] =3D =
"593b7b751dd18c2d6abcd0c4bcb29efc203d0b4373a6df98e3a455ea74ae2813"
> --=20
> 2.37.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169808): =
https://lists.openembedded.org/g/openembedded-core/message/169808
> Mute This Topic: https://lists.openembedded.org/mt/93224781/1348415
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[robert.joslyn@redrectangle.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


