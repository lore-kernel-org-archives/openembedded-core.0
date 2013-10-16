Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3ABB96CB44
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 08:54:40 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id f12so368705wgh.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 01:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=khSzTVXMHxytF4X1ijEPJxOl743m6AMNn9ceoG494bo=;
	b=J114ZzyjEqeBGNmYs2/nj9SEZc4iZX7FFSW95M/dBmJSSgt8zw1HwYHcjGCzy29ak8
	oX/YeDopErcW9/385H/4A8XBFjnlwxFcMXy06scZ9JTB383TaFB8J7z0uW+D6g6hC5yD
	KTw6KlJfyq/njslK9+gZrxF8oM5Hc9l1v1RZSLTzHfG7TtQQ36Qmhj2oX2uY+yzQ/Q7M
	AXafJOOr5bVhSbWohWyU1pBnlMYRu7LeMHKdS9OgxoDH287A1dZSiJn6GHums+2I4d+w
	f1Mcp+Q5k9RzpdW3pKG2dUHvHusQ2uDoMnqnk6JK33GecDGatiAN3LzP8g5klZBET0p1
	8fXg==
X-Gm-Message-State: ALoCoQmB0lqtpeFritZ2YO/YYsu1B0JIJewiKQ23zKUwjL1NBrcWUKJj8Lfm33NC4j6kkgSEjuyF
X-Received: by 10.180.9.139 with SMTP id z11mr23308582wia.22.1381913681165;
	Wed, 16 Oct 2013 01:54:41 -0700 (PDT)
Received: from ?IPv6:2001:610:612::403c:b6ec:4247:e13f?
	([2001:610:612:0:403c:b6ec:4247:e13f])
	by mx.google.com with ESMTPSA id q17sm3737459wiv.10.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Oct 2013 01:54:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <525DE1D4.40109@windriver.com>
Date: Wed, 16 Oct 2013 10:54:39 +0200
Message-Id: <EF2228FC-1E37-435B-A76A-426E585A2E0E@dominion.thruhere.net>
References: <1381824734-2946-1-git-send-email-rongqing.li@windriver.com>
	<E0C668BE-B0FA-4BE0-91E9-BB779A8ABDC3@dominion.thruhere.net>
	<525DE1D4.40109@windriver.com>
To: Rongqing Li <rongqing.li@windriver.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: ignore the networking device which nfs for rootfs is working on
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Oct 2013 08:54:41 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 16 okt. 2013, om 02:46 heeft Rongqing Li <rongqing.li@windriver.com> =
het volgende geschreven:

>=20
>=20
> On 10/15/2013 06:10 PM, Koen Kooi wrote:
>>=20
>> Op 15 okt. 2013, om 10:12 heeft rongqing.li@windriver.com het =
volgende geschreven:
>>=20
>>> From: Roy Li <rongqing.li@windriver.com>
>>>=20
>>> Otherwise system will hang since nfs is not disconnected
>>>=20
>>> and remove the judgement of initscript DISTRO_FEATURE when install =
init
>>> script connman, because inherit systemd will remove init script
>>=20
>>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>>> ---
>>=20
>> [..]
>>=20
>>> diff --git =
a/meta/recipes-connectivity/connman/connman/connman-nfs.service =
b/meta/recipes-connectivity/connman/connman/connman-nfs.service
>>> new file mode 100644
>>> index 0000000..9f9b690
>>> --- /dev/null
>>> +++ b/meta/recipes-connectivity/connman/connman/connman-nfs.service
>>> @@ -0,0 +1,14 @@
>>> +[Unit]
>>> +Description=3DConnection service
>>> +After=3Dsyslog.target
>>> +
>>> +[Service]
>>> +Type=3Ddbus
>>> +BusName=3Dnet.connman
>>> +Restart=3Don-failure
>>> +ExecStartPre=3D-/usr/lib64/connman/wired-setup
>>> +ExecStart=3D/usr/bin/connman-nfs
>>=20
>> Those hardcoded paths aren't going to work. And isn't:
>>=20
>=20
> Thanks, I will fix it.
>=20
>> ConditionKernelCommandLine!=3Droot=3D/dev/nfs
>>=20
>=20
> What is your meaning?

That's you are creating a huge script that does something built into =
systemd.

>=20
> -Roy
>=20
>=20
>> A lot cleaner to use in systemd?
>>=20
>=20
> --=20
> Best Reagrds,
> Roy | RongQing Li


