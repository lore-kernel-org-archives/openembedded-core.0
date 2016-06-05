Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 581B47719B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Jun 2016 21:35:32 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id k204so4151623wmk.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jun 2016 14:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=ffRyIIjcplGsXKr8fkXc89s+0qdhPZUyliTcDryZ5+M=;
	b=gahZ9LRVwEoxPWKvxlh/wqlRtnbVPLPzrcEL7avHh9f/I6gyo3MdrbbiuMyIBZEytY
	2URwLdiIzXdVxx1Bw8qQeJI30c0fh75/5aO5nG5VFf9BKgKN5P+Yd0CdukkfZJEL2dIh
	UQxD2ROsIEI5apcyFm56ppnMLjd+UpeBHqfUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ffRyIIjcplGsXKr8fkXc89s+0qdhPZUyliTcDryZ5+M=;
	b=SzK/NQ0VKH01i3KcfIs7uVKkhZZNSJwf3wyzq6PMoiXWjXTTGiJTTXTjXTuqojiTxy
	qq+h7xJlJqFIuZQBogxl6/0YF6BV8C97Ew4RDL6sgXk/+AWo79Ask8rCZaZPE/Cvqmzy
	igsHXJOzG1P85bT4oGpU0hjUn0hw/G6b1Q60fJtZbCof7C1OTWL9o+OhfQ8fZidCipiv
	waLOi2Avi/tBUqacq5rfYOjzTqXOlLuiDtDO+UJaQtZbDpsLmi5rb1KnDKAROSUClIoV
	ySokueeoaerVpzYKNO/zfiEnwnAmpW5ACFztl20FTl9+9rsY9F2vdXKaYN830f5JjGIs
	uIKQ==
X-Gm-Message-State: ALyK8tKbK7t3poVIydfGMUXbkMH6SdH2qj0MRTZsHUuMUdplJX91eCzuRu1eHLurw2izjZsHnYWhoHxcf4u2b/9m
X-Received: by 10.28.184.199 with SMTP id i190mr8312693wmf.57.1465162532281;
	Sun, 05 Jun 2016 14:35:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.20.105 with HTTP; Sun, 5 Jun 2016 14:35:12 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Sun, 5 Jun 2016 23:35:12 +0200
Message-ID: <CAP71WjyMbP4RReFjJ-TEi-Kx8EPEVpm3qBZBnXmCm2_3_0D_8w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: question about -native and prefix
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
X-List-Received-Date: Sun, 05 Jun 2016 21:35:32 -0000
Content-Type: text/plain; charset=UTF-8

hi,

i was looking at log files and I noticed that when building a 'native'
recipe ${prefix} is set to the sysroot path, e.g.

export prefix="/home/nicolas.dechesne/work/oe-rpb/build-rpb/tmp-rpb-glibc/sysroots/x86_64-linux/usr"

as such during do_install() files are typically installed in
${DESTDIR}${prefix}, and as such we end up with a 'weird' path, such
as :

x86_64-linux-libtool: install: /usr/bin/install -c
.libs/libopkg.so.1.0.0
/home/nicolas.dechesne/work/oe-rpb/build-rpb/tmp-rpb-glibc/work/x86_64-linux/opkg-native/1_0.3.0-r0/image/home/nicolas.dechesne/work/oe-rpb/build-rpb/tmp-rpb-glibc/sysroots/x86_64-linux/usr/lib/libopkg.so.1.\

e.g. the 'full path' of the sysroot is recreated inside ${D}. It
doesn't seem to make anything bad, but i just noticed it, and it
surprised me. what's the rationale for that?

I would have expected to find the sysroot 'relative' path in ${D}. no
the the absolute path.

cheers
nico

