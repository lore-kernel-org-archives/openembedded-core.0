Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8ACAA7029E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 09:35:45 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id b8so447759lan.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 02:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=TKtDm4S1jo0ilMx7ZtDNGkur8iJ6ft3e1lLyfI0e3Z8=;
	b=h4wEYyqZY0K/ZcqTedjHLIMVUMgMMgIEZdP2Kb6jALS0a/ftyv+dpiJW2Md2IroZfT
	dKD5IUHXMhCXZNzGIuE9kdK+d6VLCWeQkqktKG2vkjb7mu13aG7HSXqrFz8pHNpuLPgk
	AoNdBZpolxTZbIgMP5c1Z8QVoNXFKNYRv5wLXxhFjWr6bgxMVKf3r6GZW0Fi91yP0W6q
	eYbvKgY6SdK21RxdkZmFHBY+MfYgF5I+7kC2u/PutgyftAm/utbAkwEov9iMyx/uurQs
	jZyjUwZpEtsuEa6Zt9OAEgvIFrLYilOpQgxRBZcBkGkAjMYmhbEUcXBw4fgnAzMp0VVD
	Ts3A==
MIME-Version: 1.0
X-Received: by 10.152.207.11 with SMTP id ls11mr7678752lac.62.1405503345988;
	Wed, 16 Jul 2014 02:35:45 -0700 (PDT)
Received: by 10.112.207.9 with HTTP; Wed, 16 Jul 2014 02:35:45 -0700 (PDT)
Date: Wed, 16 Jul 2014 11:35:45 +0200
Message-ID: <CAAQYJAvV6166k+wVaSwJStNUdu5r9n+muGxL37hDz0jt+P32kw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: [RFC] Busybox: do not enable ENABLE_FEATURE_NON_POSIX_CP
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
X-List-Received-Date: Wed, 16 Jul 2014 09:35:48 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I was hit by a strange issue while benchmarking: I was copying some
large files to /dev/null and that was failing.
In fact, busybox cp foo /dev/null (and even cat foo > /dev/null) are
transforming the target in a regular file, with increasing size.At the
end devtmpfs was full...

After som eresearch I discovered that strange Busybox configuration option
ENABLE_FEATURE_NON_POSIX_CP.

Guess what? It is ENABLED in oe-core!

http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/busybox/busybox/defconfig#n113

Now, do we really want it enabled by default?

Cheers

Andrea

P.S. I agree with  https://forum.openwrt.org/viewtopic.php?id=27235
""...ill-conceived feature""

