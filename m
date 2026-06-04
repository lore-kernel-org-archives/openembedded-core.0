Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEA8CD6E75
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 20:10:11 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52.1780603809048628592
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 13:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sz66vn7/;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso559922f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 13:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780603807; x=1781208607; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYGF1mkrHA7SZOHnRq6o+0jdnGlO1IsuCI3UOtk2ly0=;
        b=sz66vn7/TchhhHMSJK5Aayk90Zfj83b4HHCzNXhP9pBXPmOMkO6p4M9vLv52IZJd4Y
         +QGyAiiEEknIq0c+J/2USZyAflKwwzi2kq3ixERilbbxIptjwSRTDxVSmn2F5HTTnNNs
         aDqpLiobsK4o2q/VFiUFBcxd7ROLG3jTCnW0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780603807; x=1781208607;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LYGF1mkrHA7SZOHnRq6o+0jdnGlO1IsuCI3UOtk2ly0=;
        b=ZqBDL6zn40qIg+uPcUCx92FHCMyzrGMKgMZPLd20m4cSK/WD91VC/VNRjXZ1WnWcH6
         gu6arhRa8W6krygppKn4JG4Z/VpjJ/Opv/YveuWuwGd5JqDBJNXV8SbvtjSha9xU/+0q
         wLQBfx9SF5J7noYa/GkyaqBQW70Fy9M3X+4I4UILMAVkA0CsYMZFUFxYc8IjKrW0yhPG
         ypPYEQcQPOe8UruvNZYS1urTdygtYWU7uTHsGgJVJEyKLExLaMvs7/QZPvVyYf2+yBWR
         eEbCbZnVKlS27swDAbae7wIjJqot/G8Op/Ooks2IRwHd+ckAqn9QxajT3WeTdcq/JTG7
         N7Mw==
X-Forwarded-Encrypted: i=1; AFNElJ9QS2dm3JtIlOuISbBwxS5Gv19JW1JKCt6Htm0tTkAGmaDAXD9OJRq3mxt8qgvSWZyARsEnIKDnBDKX+wJOrFSFug==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywm4WZx8Ssa85mv2Jw/QCwkVWyyoKQ+TVaz2CZS1imGDRr3B+WO
	un/vIJmkdOYFVKgS2PuR6AGXs4p1kn6Vd2ik5QT9cQyC+VoDy67tnOdFqfRW7P0vC0w=
X-Gm-Gg: Acq92OHD6UGloociL0ooOWnC1b/jwCrV1x9oHb5/D7g1RcAD6n32GbITg0+75EviM95
	2rrjrOnRXPs0oGMNpTMad4riNzS5N2LZa5BG2+d6gEtmMXf7hC5m8CAYl0gggjuo7jYVlk9VIIW
	oVCKy9SvImhSRl6j5lSLNrf45gU4f3JY7wvmMqmSb0vSicasv3Q/k2KyB62AEpNBvsjTARos2Uw
	Yxop8yvoaWNsE7VYJJ5Ne/+zd3uFMPj1U7GLWn3qSJg8BOijjuh3WsPvMH5xNgojhdPfji2/9iL
	Nq2zDm2W+ZORE5VQAf5PGHuFKHXHljT/Wk1JXekx8U2rnXkgP9JLNLGgakUB0L9l5OsBkBS7LkT
	IMZKyZtB3dsYBE035ieGKBTHD8GmC7/hozq7PdSbg1o0bS124xaU4vioBhIreT6Ptk46HfRT59g
	E7Rf+CV0uHOv6e9f3O9/WodyBrUESpiytr81qKmHvpL/5q1pqmq9xZxwNcovf3h2wtzyVXDcTOk
	GNegwtiQkMxfODGnR5wGzgQYTs=
X-Received: by 2002:a05:600c:c16f:b0:490:b8e6:be40 with SMTP id 5b1f17b1804b1-490c25fc0d5mr1204085e9.21.1780603807264;
        Thu, 04 Jun 2026 13:10:07 -0700 (PDT)
Received: from localhost (2a01cb001331aa00ae426e28cd306e8e.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:ae42:6e28:cd30:6e8e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c1574dc4sm14535555e9.0.2026.06.04.13.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 13:10:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jun 2026 22:10:06 +0200
Message-Id: <DJ0JDC0E8QIM.2PLQBKV0K6TIN@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Bruno VERNAY" <bruno.vernay@se.com>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <hsimeliere.opensource@witekio.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 1/7] gnutls: Fix CVE-2026-33846
X-Mailer: aerc 0.20.0
References: <20260520081403.3052797-1-hsimeliere.opensource@witekio.com>
 <DJ0529SO7U38.2KY8QAKJ8TRSU@smile.fr>
In-Reply-To: <DJ0529SO7U38.2KY8QAKJ8TRSU@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 20:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238136

On Thu Jun 4, 2026 at 10:57 AM CEST, Yoann Congal wrote:
> On Wed May 20, 2026 at 10:13 AM CEST, Hugo Simeliere via lists.openembedd=
ed.org wrote:
>> From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witek=
io.com>
>>
>> Pick patch from [1] as mentioned in Debian report in [2].
>> Pick pre-patch [3] to minimize conflicts.
>>
>> [1] https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b=
7df3d383d1ff78

Hello (again),

This patch is in the 3.8.13 tag but not in the 3.8.12 tag used on
wrynose. There was a 3.8.13 wrynose upgrade sent but I can't accept it.
So, this patch (as well as at least 2/7, I have not checked the others) mus=
t
be sent to wrynose before I can accept them on scarthgap. Can you do
that and ping back here when it's done?

Thanks!

>> [2] https://security-tracker.debian.org/tracker/CVE-2026-33846
>> [3] https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd=
4bb1bf4cbd1fc0
>>
>> Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensourc=
e@witekio.com>
>> Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
>> ---
>>  .../gnutls/gnutls/CVE-2026-33846-pre.patch    | 97 +++++++++++++++++++
>>  .../gnutls/gnutls/CVE-2026-33846.patch        | 67 +++++++++++++
>>  meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  2 +
>>  3 files changed, 166 insertions(+)
>>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33846-pr=
e.patch
>>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33846.pa=
tch
>>
>> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33846-pre.patch=
 b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846-pre.patch
>> new file mode 100644
>> index 0000000000..71266cb338
>> --- /dev/null
>> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846-pre.patch
>> @@ -0,0 +1,97 @@
>> +From e51ef765b942968949e29797a73727c371397eea Mon Sep 17 00:00:00 2001
>> +From: Alexander Sosedkin <asosedkin@redhat.com>
>> +Date: Fri, 17 Apr 2026 17:49:31 +0200
>> +Subject: [PATCH 1/2] buffers: shorten merge_handshake_packet using recv=
_buf
>
> As far as I can tell this patch is only cosmetic and I'd rather not
> merge it unless you have a compeling reason.
>
> To apply CVE-2026-33846.patch, it looks like you will need to change it
> to use "session->internals.handshake_recv_buffer" instead of "recv_buf".
>
> Regards,
>
>> +
>> +I had vague concerns about thread-safety of this,
>> +but then this pattern already exists within the file.
>> +
>> +CVE: CVE-2026-33846
>> +Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/9d=
effca528c23bbb218f5ec3bd4bb1bf4cbd1fc0]
>> +
>> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
>> +(cherry picked from commit 9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0)
>> +Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensour=
ce@witekio.com>
>> +---
>> + lib/buffers.c | 52 +++++++++++++++++----------------------------------
>> + 1 file changed, 17 insertions(+), 35 deletions(-)
>> +
>> +diff --git a/lib/buffers.c b/lib/buffers.c
>> +index 672380b05..d54c77022 100644
>> +--- a/lib/buffers.c
>> ++++ b/lib/buffers.c
>> +@@ -967,9 +967,11 @@ static int merge_handshake_packet(gnutls_session_t=
 session,
>> + 	int exists =3D 0, i, pos =3D 0;
>> + 	int ret;
>> +=20
>> ++	handshake_buffer_st *recv_buf =3D
>> ++		session->internals.handshake_recv_buffer;
>> ++
>> + 	for (i =3D 0; i < session->internals.handshake_recv_buffer_size; i++)=
 {
>> +-		if (session->internals.handshake_recv_buffer[i].htype =3D=3D
>> +-		    hsk->htype) {
>> ++		if (recv_buf[i].htype =3D=3D hsk->htype) {
>> + 			exists =3D 1;
>> + 			pos =3D i;
>> + 			break;
>> +@@ -1005,44 +1007,24 @@ static int merge_handshake_packet(gnutls_sessio=
n_t session,
>> + 		_gnutls_write_uint24(0, &hsk->header[6]);
>> + 		_gnutls_write_uint24(hsk->length, &hsk->header[9]);
>> +=20
>> +-		_gnutls_handshake_buffer_move(
>> +-			&session->internals.handshake_recv_buffer[pos], hsk);
>> ++		_gnutls_handshake_buffer_move(&recv_buf[pos], hsk);
>> +=20
>> + 	} else {
>> +-		if (hsk->start_offset <
>> +-			    session->internals.handshake_recv_buffer[pos]
>> +-				    .start_offset &&
>> +-		    hsk->end_offset + 1 >=3D
>> +-			    session->internals.handshake_recv_buffer[pos]
>> +-				    .start_offset) {
>> +-			memcpy(&session->internals.handshake_recv_buffer[pos]
>> +-					.data.data[hsk->start_offset],
>> ++		if (hsk->start_offset < recv_buf[pos].start_offset &&
>> ++		    hsk->end_offset + 1 >=3D recv_buf[pos].start_offset) {
>> ++			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
>> + 			       hsk->data.data, hsk->data.length);
>> +-			session->internals.handshake_recv_buffer[pos]
>> +-				.start_offset =3D hsk->start_offset;
>> +-			session->internals.handshake_recv_buffer[pos]
>> +-				.end_offset =3D MIN(
>> +-				hsk->end_offset,
>> +-				session->internals.handshake_recv_buffer[pos]
>> +-					.end_offset);
>> +-		} else if (hsk->end_offset >
>> +-				   session->internals.handshake_recv_buffer[pos]
>> +-					   .end_offset &&
>> +-			   hsk->start_offset <=3D
>> +-				   session->internals.handshake_recv_buffer[pos]
>> +-						   .end_offset +
>> +-					   1) {
>> +-			memcpy(&session->internals.handshake_recv_buffer[pos]
>> +-					.data.data[hsk->start_offset],
>> ++			recv_buf[pos].start_offset =3D hsk->start_offset;
>> ++			recv_buf[pos].end_offset =3D
>> ++				MIN(hsk->end_offset, recv_buf[pos].end_offset);
>> ++		} else if (hsk->end_offset > recv_buf[pos].end_offset &&
>> ++			   hsk->start_offset <=3D recv_buf[pos].end_offset + 1) {
>> ++			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
>> + 			       hsk->data.data, hsk->data.length);
>> +=20
>> +-			session->internals.handshake_recv_buffer[pos]
>> +-				.end_offset =3D hsk->end_offset;
>> +-			session->internals.handshake_recv_buffer[pos]
>> +-				.start_offset =3D MIN(
>> +-				hsk->start_offset,
>> +-				session->internals.handshake_recv_buffer[pos]
>> +-					.start_offset);
>> ++			recv_buf[pos].end_offset =3D hsk->end_offset;
>> ++			recv_buf[pos].start_offset =3D MIN(
>> ++				hsk->start_offset, recv_buf[pos].start_offset);
>> + 		}
>> + 		_gnutls_handshake_buffer_clear(hsk);
>> + 	}
>> +--=20
>> +2.43.0
>> +
>> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch b/m=
eta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
>> new file mode 100644
>> index 0000000000..e7d5cc6c2b
>> --- /dev/null
>> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
>> @@ -0,0 +1,67 @@
>> +From 68e0c900c1111206fa4a135cdb43827f3b908284 Mon Sep 17 00:00:00 2001
>> +From: Alexander Sosedkin <asosedkin@redhat.com>
>> +Date: Fri, 17 Apr 2026 18:21:36 +0200
>> +Subject: [PATCH 2/2] buffers: add more checks to DTLS reassembly
>> +
>> +Previously, gnutls didn't check that DTLS fragments claimed
>> +a consistent message_length value.
>> +Additionally, a crucial array size check was missing,
>> +enabling an attacker to cause a heap overwrite.
>> +The updated version rejects fragments with mismatching length
>> +and adds a missing boundary check.
>> +
>> +Reported-by: Haruto Kimura (Stella)
>> +Reported-by: Oscar Reparaz
>> +Reported-by: Zou Dikai
>> +Fixes: #1816
>> +Fixes: #1838
>> +Fixes: #1839
>> +Fixes: CVE-2026-33846
>> +Fixes: GNUTLS-SA-2026-04-29-1
>> +CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:H/A:H
>> +CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
>> +
>> +CVE: CVE-2026-33846
>> +Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/65=
ab33fa54e34fba69d793735b7df3d383d1ff78]
>> +
>> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
>> +(cherry picked from commit 65ab33fa54e34fba69d793735b7df3d383d1ff78)
>> +Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensour=
ce@witekio.com>
>> +---
>> + lib/buffers.c | 20 ++++++++++++++++++++
>> + 1 file changed, 20 insertions(+)
>> +
>> +diff --git a/lib/buffers.c b/lib/buffers.c
>> +index d54c77022..5d4d16276 100644
>> +--- a/lib/buffers.c
>> ++++ b/lib/buffers.c
>> +@@ -1010,6 +1010,26 @@ static int merge_handshake_packet(gnutls_session=
_t session,
>> + 		_gnutls_handshake_buffer_move(&recv_buf[pos], hsk);
>> +=20
>> + 	} else {
>> ++		if (hsk->length !=3D recv_buf[pos].length) {
>> ++			/* inconsistent across fragments */
>> ++			_gnutls_handshake_buffer_clear(hsk);
>> ++			return gnutls_assert_val(
>> ++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
>> ++		}
>> ++		/* start_offset + data.length <=3D hsk->length <=3D max_length */
>> ++		if (hsk->length < hsk->start_offset + hsk->data.length) {
>> ++			/* impossible claims, overflow requested */
>> ++			_gnutls_handshake_buffer_clear(hsk);
>> ++			return gnutls_assert_val(
>> ++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
>> ++		}
>> ++		if (hsk->length > recv_buf[pos].data.max_length) {
>> ++			/* we don't have this much allocated, overflow guard */
>> ++			_gnutls_handshake_buffer_clear(hsk);
>> ++			return gnutls_assert_val(
>> ++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
>> ++		}
>> ++
>> + 		if (hsk->start_offset < recv_buf[pos].start_offset &&
>> + 		    hsk->end_offset + 1 >=3D recv_buf[pos].start_offset) {
>> + 			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
>> +--=20
>> +2.43.0
>> +
>> diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-=
support/gnutls/gnutls_3.8.4.bb
>> index ccb6a2b4b2..e40a654a8e 100644
>> --- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
>> +++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
>> @@ -43,6 +43,8 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v=
${SHRT_VER}/gnutls-${PV}.tar
>>             file://CVE-2025-14831-7.patch \
>>             file://CVE-2025-14831-8.patch \
>>             file://CVE-2025-14831-9.patch \
>> +           file://CVE-2026-33846-pre.patch \
>> +           file://CVE-2026-33846.patch \
>>             "
>> =20
>>  SRC_URI[sha256sum] =3D "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd=
44cdfa7f36ebc3a9b"


--=20
Yoann Congal
Smile ECS


