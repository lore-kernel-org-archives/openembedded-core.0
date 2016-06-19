Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id C53E96FF6B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 09:52:53 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id a66so41088535wme.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 02:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:date:mime-version
	:content-transfer-encoding;
	bh=uS+ynNibcvgKP1JSEL8diWt1iWRktJNUFljSWue0PCQ=;
	b=wEIteW1ZDMf3hfqKZXG5W2Wc6FO4IcKhQPpQB2G4yginVO9nh3neTfJZeKHi5X8oQ0
	OQ/0wskWOehUV2UiyAYttIAVKERrHIxihhQdg/2b5JsN9CYZU99Xo7Ie/Sc8Uz91XcNb
	T/a4qz9uNRpGzP54EtJ0vqVPDBGcvLuVAQ0Jeznfw79ttNb+F/ywHNzlco4+x3YVafUt
	uUjYxdQv2MFjWmKUqKa6KKsKNelfWBXR+4CdZfJJnFsdZ+A34M+gzX1fuoDzxbBCd1ms
	kxthAee0vyiiM3v6aiWA68mmefQE4IvOZPoWiB8jq/3W2ZdQJS2oJMsXgEPuQMKCPwyG
	Ba5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:mime-version
	:content-transfer-encoding;
	bh=uS+ynNibcvgKP1JSEL8diWt1iWRktJNUFljSWue0PCQ=;
	b=DqoPMlvwvVmILr/IBsF0887WZVcUQGiZSmnRrMT8jBj9r8WwXpP0IWjg1qq/O9oD4z
	aCQpsdiv1RubJlFFfb6FYpTC8upWFfJu0YHuKAX+52FeTq9xw6dtAmKVqZMXqy0sAcl8
	AflUQa8UvRlSRMREzQhNtHRdpqUTgNvxNmsgJ1qabCwBN08ujVX7HF9oXWpzpDEuWp2I
	8GYd0B1cTx4GZVaVRKs05u/lO4r6jiPuLivgS6tImBK6Q1lTY3yvRTfacVxCJfedIs9v
	pjlZt5oOQ18pVhpIM9V92oiMQvwyD4lb3ZXO8c1KmkxM/OjR4sNfIiH8RumeKkJeK8Xo
	YH0Q==
X-Gm-Message-State: ALyK8tLdhrgD0HNKP8P8S5hpYnAgJLIHZvTIZaRYGPtsscBgbNTm04zJq7hZqNI7Sq3+OQ==
X-Received: by 10.28.191.90 with SMTP id p87mr5922587wmf.69.1466329973205;
	Sun, 19 Jun 2016 02:52:53 -0700 (PDT)
Received: from Saturn.local.all (212-41-125-187.adsl.solnet.ch.
	[212.41.125.187]) by smtp.gmail.com with ESMTPSA id
	qm9sm11955763wjc.36.2016.06.19.02.52.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Jun 2016 02:52:52 -0700 (PDT)
Message-ID: <1466329971.20368.18.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jun 2016 11:52:51 +0200
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: packageconfig, add depends if feature is disabled
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
X-List-Received-Date: Sun, 19 Jun 2016 09:52:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi

The recent unconditional move towards gtk3 in oe-core forces me to
follow with some of my recipes.

I tried this with packageconfig, however there seems to be no easy way
to specify DEPENDS in case a packageconfig feature is disabled.
i.e. for gtk3 we need gtk+3 in depends while for gtk2 we need gtk+.
I ended up with:

    PACKAGECONFIG ?= "gtk3"
    PACKAGECONFIG[gtk3] = "--enable-gtk3,,gtk+3"
    python __anonymous () {
        depends = d.getVar("DEPENDS", d, 1)
        if 'gtk3' not in d.getVar('PACKAGECONFIG', True):
            d.setVar("DEPENDS", "%s gtk+" % depends)
    }

The following would also be possible but then nothing makes sure that
one, and exactly one of gtk2, gtk3 is in PACKAGECONFIG.

    PACKAGECONFIG ?= "gtk3"
    PACKAGECONFIG[gtk2] = ",,gtk+"
    PACKAGECONFIG[gtk3] = "--enable-gtk3,,gtk+3"

Any ideas?
Would this use case merit an extension to packageconfig, e.g.:

    # PACKAGECONFIG ??= "<default options>"
    # PACKAGECONFIG[foo] = "--enable-foo,--disable-foo,
                            foo_depends,foo_runtime_depends,
                            not_foo_depends,not_foo_rdepends"

Which would simplify the above to:

    PACKAGECONFIG ?= "gtk3"
    PACKAGECONFIG[gtk3] = "--enable-gtk3,,gtk+3,,gtk+"

Regards
Max

