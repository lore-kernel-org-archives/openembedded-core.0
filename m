Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C6A7C7F26A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 15:53:29 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n9so77796940wru.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 08:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=uqSOFiazyolkXnx/A8AsE0NwiX9CLgu/im8WU9fR4y8=;
	b=PADR9Saed/tHDFPOCaWzNRUMSy4lHuQJB11Ryvkx+6NvAdlLuRbjE0omA0ybivO+No
	reIzOkuG49q1W/H3lKIOI+vhGM+lM7te0N13QRPzvWlZ31d/ZTVint2xoXFosq5AUIeF
	16+OTTco+4FgKU5bt77t12Y7tyqiVFWd4rXG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=uqSOFiazyolkXnx/A8AsE0NwiX9CLgu/im8WU9fR4y8=;
	b=Ht5XiRBiz+2ZhIwTocNOj6Z/i/9IgZvYltDUK7D+lLaS358E/V5lGlknnNhwY8g03P
	B6GdUxGXWmGrVOb0iD3NFu5NyIiFwgRhX6YHbezr7tLWQaT3wz38sPesHOELqEiwgDJd
	I3heOFIoYVmDCJXyFWsLMOh1kaGoh4CFn0ntZdXw4/04YBffhUlvvlT3nFbQFufEXtnA
	SbRWym8dfcfBBRCWT/JvovbKp+RKSJFz5NHldBoH/pzzXC31pvikn6mEJlASgH+iyvw9
	TM+Knxdvu9UQReHkVINmuR/4ksgDpehe/iltLxSROdIzUkJGlLP2VKcGdCulVKmt1wdR
	ECQg==
X-Gm-Message-State: APjAAAWbvncSLgSZ6l2Egz47/kF1PFM+57gydutoEQejVi8/bt9XA336
	60w62nHmSR7sjrc4c3lOOwSnwzUEl3c=
X-Google-Smtp-Source: APXvYqx9pDLYQc6wqUSirjof3bvrNMa+muh5wcAYsuWFSE2DkdRPUx++FhfwoHqWy39h2i8hYSCUzQ==
X-Received: by 2002:a5d:5452:: with SMTP id w18mr7863845wrv.327.1564761210255; 
	Fri, 02 Aug 2019 08:53:30 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i12sm90739412wrx.61.2019.08.02.08.53.29
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 08:53:29 -0700 (PDT)
Message-ID: <a3cde6526f42e115340654402a3e89bed42facd8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 02 Aug 2019 16:53:28 +0100
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Joshua Watt <JPEW.hacker@gmail.com>
Subject: Hash Equivalency - What this means for developer productivity
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
X-List-Received-Date: Fri, 02 Aug 2019 15:53:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This has been talked about in a lot of the project meetings but I
wanted to ensure its on the mailing list too.

master-next (and hopefully soon, master) now contain patches which
enable "hash equivalency" support in runqueue in bitbake. That doesn't
sound so interesting until I explain what this means.

Currently, if I do:

$ bitbake core-image-sato

then:

$ bitbake m4-native -c install -f

this would mean that core-image-sato would rebuild, nearly from
scratch. The task stamp for all tasks onward from m4-native would
change.

With the patches in master-next and this configuration in local.conf:

BB_HASHSERVE = "localhost:0"
BB_SIGNATURE_HANDLER = "OEEquivHash"

$ bitbake core-image-sato
$ bitbake m4-native -c install -f
$ bitbake core-image-sato

will result in do_populate_sysroot of m4-native running, it will see
the output matches the previous build and it will then skip to the
rootfs generation pulling all the other pieces from sstate.

Note that for this to work, m4-native has to have previously built with
the hashserv running, otherwise it has nothing to compare its output
to.

I think this should be a "big deal" for many developers, reducing
unneded rebuilds and hence speeding up development.

As with any new feature, there are likely going to be some some
teething issues but I'm very opitmistic about some of the benefits this
should bring!

Cheers,

Richard





