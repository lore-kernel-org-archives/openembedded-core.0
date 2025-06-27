Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4143EC83013
	for <webhook@archiver.kernel.org>; Sun, 29 Jun 2025 18:55:23 +0000 (UTC)
Received: from forward102a.mail.yandex.net (forward102a.mail.yandex.net [178.154.239.85])
 by mx.groups.io with SMTP id smtpd.web10.16015.1751036591342124187
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 08:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yandex.ru header.s=mail header.b=XSq5avTC;
 spf=pass (domain: yandex.ru, ip: 178.154.239.85, mailfrom: denisova.olga.k@yandex.ru)
Received: from mail-nwsmtp-mxback-production-main-51.vla.yp-c.yandex.net (mail-nwsmtp-mxback-production-main-51.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:2707:0:640:185b:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id 991C360EB2;
	Fri, 27 Jun 2025 18:03:08 +0300 (MSK)
Received: from mail.yandex.ru (2a02:6b8:c2a:3d9:0:640:daee:0 [2a02:6b8:c2a:3d9:0:640:daee:0])
	by mail-nwsmtp-mxback-production-main-51.vla.yp-c.yandex.net (mxback/Yandex) with HTTPS id 63YtU20L4W20-TtJeM5lI;
	Fri, 27 Jun 2025 18:03:08 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1751036588; bh=m489Dl4e6VxQWh2tNHG0u9M4ALOn9zZLH2SG98EEnmQ=;
	h=Message-Id:References:Date:Subject:To:In-Reply-To:From;
	b=XSq5avTCAGpMHLXof3oT0uXhyRm+A+sVUsKRMCQGunTjhR2EAz7roo6F3mInAaOE0
	 KqhXLXgqY38CSoOfoSuFcAKAPgd5h0tHwSIKHBHuqq/aMZV5WGcdugXAscCMhEVxBv
	 Y7Obu1B/Ixnt+Ue2NJSPPH1ZThcr3blKj89H3gQg=
Authentication-Results: mail-nwsmtp-mxback-production-main-51.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Received: by mail-sendbernar-production-main-83.vla.yp-c.yandex.net (sendbernar/Yandex) with HTTPS id 394899c9826d5ce2dcb9675b349d37c4;
	Fri, 27 Jun 2025 18:03:08 +0300
From: =?utf-8?B?0J7Qu9GM0LPQsCDQlNC10L3QuNGB0L7QstCw?= <denisova.olga.k@yandex.ru>
To: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"sider123456789101112131415@gmail.com" <sider123456789101112131415@gmail.com>,
	"gavrilov.andrew1999@yandex.ru" <gavrilov.andrew1999@yandex.ru>,
	"tinyakovx@gmail.com" <tinyakovx@gmail.com>
In-Reply-To: <20250415153404.12404-1-denisova.olga.k@yandex.ru>
References: <20250415153404.12404-1-denisova.olga.k@yandex.ru>
Subject: Re: [PATCH] buildstats.py: extend diskstats support for NVMe and flexible token count
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Fri, 27 Jun 2025 18:03:08 +0300
Message-Id: <262221751036246@mail.yandex.ru>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Jun 2025 18:55:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219448

PGRpdj4rIGdhdnJpbG92LmFuZHJldzE5OTlALCBzaWRlcjEyMzQ1Njc4OTEwMTExMjEzMTQxNUAs
IHRpbnlha292eEA8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+R29vZCBhZnRl
cm5vb24hPC9kaXY+PGRpdj5Db3VsZCB5b3UgcGxlYXNlIGxldCBtZSBrbm93IHRoZSBjdXJyZW50
IHN0YXR1cyBvZiB0aGlzIHBhdGNoPzwvZGl2PjxkaXY+QmVzdCByZWdhcmRzLCBPbGdhIERlbmlz
b3ZhPC9kaXY+PGRpdj4tLS0tLS0tLS0tLS0tLS0tPC9kaXY+PGRpdj7QmtC+0LzRgzogb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyAob3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyk7PC9kaXY+PGRpdj7QotC10LzQsDogW1BBVENIXSBidWlsZHN0
YXRzLnB5OiBleHRlbmQgZGlza3N0YXRzIHN1cHBvcnQgZm9yIE5WTWUgYW5kIGZsZXhpYmxlIHRv
a2VuIGNvdW50OzwvZGl2PjxkaXY+MTUuMDQuMjAyNSwgMTg6MzQsICJkZW5pc292YS1vayIgJmx0
O2Rlbmlzb3ZhLm9sZ2Eua0B5YW5kZXgucnUmZ3Q7OjwvZGl2PjxibG9ja3F1b3RlPjxwPkFkZGVk
IHN1cHBvcnQgZm9yIE5WTWUgZGV2aWNlcyBpbiB0aGUgZGlza3N0YXRzIHJlZ2V4IHBhdHRlcm4g
dG8gZW5zdXJlIHN0YXRzIGFyZSBwcm9wZXJseSBjb2xsZWN0ZWQgZnJvbSBkZXZpY2VzIGxpa2Ug
bnZtZTBuMS48YnIgLz48YnIgLz5SZWxheGVkIHRoZSBjaGVjayBmb3IgdGhlIG51bWJlciBvZiBm
aWVsZHMgaW4gL3Byb2MvZGlza3N0YXRzIGZyb20gYW4gZXhhY3QgbWF0Y2ggKDE0KSB0byBhIG1p
bmltdW0gY2hlY2sgKGF0IGxlYXN0IDE0KSwgdG8gaGFuZGxlIGtlcm5lbCB2YXJpYXRpb25zIGFu
ZCBhZGRpdGlvbmFsIGZpZWxkcyBncmFjZWZ1bGx5LjxiciAvPjxiciAvPlNpZ25lZC1vZmYtYnk6
IGRlbmlzb3ZhLW9rICZsdDs8YSBocmVmPSJtYWlsdG86ZGVuaXNvdmEub2xnYS5rQHlhbmRleC5y
dSIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj5kZW5pc292YS5vbGdhLmtAeWFuZGV4LnJ1PC9h
PiZndDs8YnIgLz4tLS08YnIgLz7CoGxpYi9vZS9idWlsZHN0YXRzLnB5IHwgNCArKy0tPGJyIC8+
wqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKTxiciAvPjxi
ciAvPmRpZmYgLS1naXQgYS9saWIvb2UvYnVpbGRzdGF0cy5weSBiL2xpYi9vZS9idWlsZHN0YXRz
LnB5PGJyIC8+aW5kZXggMWZmZTY3OTgwMS4uMzU5YWQyYTQ2MCAxMDA2NDQ8YnIgLz4tLS0gYS9s
aWIvb2UvYnVpbGRzdGF0cy5weTxiciAvPisrKyBiL2xpYi9vZS9idWlsZHN0YXRzLnB5PGJyIC8+
QEAgLTY2LDcgKzY2LDcgQEAgY2xhc3MgU3lzdGVtU3RhdHM6PGJyIC8+wqDCoMKgwqDCoMKgwqDC
oMKgc2VsZi5taW5fc2Vjb25kcyA9IDEuMCAtIHNlbGYudG9sZXJhbmNlPGJyIC8+wqA8YnIgLz7C
oMKgwqDCoMKgwqDCoMKgwqBzZWxmLm1lbWluZm9fcmVnZXggPSByZS5jb21waWxlKHJiJ14oTWVt
VG90YWx8TWVtRnJlZXxCdWZmZXJzfENhY2hlZHxTd2FwVG90YWx8U3dhcEZyZWUpOlxzKihcZCsp
Jyk8YnIgLz4tIHNlbGYuZGlza3N0YXRzX3JlZ2V4ID0gcmUuY29tcGlsZShyYideKFtoc3ZdZC58
bXRkYmxvY2tcZHxtbWNibGtcZHxjY2lzcy9jXGQrZFxkKy4qKSQnKTxiciAvPisgc2VsZi5kaXNr
c3RhdHNfcmVnZXggPSByZS5jb21waWxlKHJiJ14oW2hzdl1kLnxtdGRibG9ja1xkfG1tY2Jsa1xk
fGNjaXNzL2NcZCtkXGQrfG52bWVcZCtuXGQrLiopJCcpPGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKg
c2VsZi5kaXNrc3RhdHNfbHRpbWUgPSBOb25lPGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgc2VsZi5k
aXNrc3RhdHNfZGF0YSA9IE5vbmU8YnIgLz7CoMKgwqDCoMKgwqDCoMKgwqBzZWxmLnN0YXRfbHRp
bWVzID0gTm9uZTxiciAvPkBAIC05NCw3ICs5NCw3IEBAIGNsYXNzIFN5c3RlbVN0YXRzOjxiciAv
PsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAoYidNZW1Ub3RhbCcsIGInTWVtRnJlZScsIGInQnVmZmVycycsIGInQ2FjaGVkJywg
YidTd2FwVG90YWwnLCBiJ1N3YXBGcmVlJyldKSArIGInXG4nKTxiciAvPsKgPGJyIC8+wqDCoMKg
wqDCoGRlZiBfZGlza3N0YXRzX2lzX3JlbGV2YW50X2xpbmUoc2VsZiwgbGluZXRva2Vucyk6PGJy
IC8+LSBpZiBsZW4obGluZXRva2VucykgIT0gMTQ6PGJyIC8+KyBpZiBsZW4obGluZXRva2Vucykg
Jmx0OyAxNDo8YnIgLz7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBGYWxzZTxiciAv
PsKgwqDCoMKgwqDCoMKgwqDCoGRpc2sgPSBsaW5ldG9rZW5zWzJdPGJyIC8+wqDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIHNlbGYuZGlza3N0YXRzX3JlZ2V4Lm1hdGNoKGRpc2spPC9wPi0tPGJyIC8+
Mi4zNC4xPGJyIC8+wqA8L2Jsb2NrcXVvdGU+

