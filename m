Return-Path: <geissonator@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0355779832
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 19:03:07 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id p84-v6so29160628oic.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2018 12:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=jt1Pz7uUpi5MtkabRVbB4QlEOO2fegbYClI3LwEcGw8=;
	b=ose6FFY5HmMsWOvHlxknzPiZPgyEvnq2nbD6f3FGCHl98ImCyukskjy88Vl7OTdLal
	h9+HwbZXmCYhZQjTj45BOf/Jt5IHN1AmZrSo+22efOFnkD2aNmdMqF86CfUEN8Wj456d
	mvCBGvykVJSbG9nSgTixYHkqf00AYMOD/XdLgxoLIWdYZHr2d+WaQU5r6peqTw7ptylO
	/si7Pbqbx7xxXC8P9E1rZ9s3LrDkXwm41E2au/HTRH4SQcIg5N1PKFUQugoz5qAHqGog
	Ibe5MBQDYPD3D/F7a53dCKpqmJhfGgagG6cePD1rsuugiRIkbdAoUsAufIY/sQhaDs4z
	Kjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=jt1Pz7uUpi5MtkabRVbB4QlEOO2fegbYClI3LwEcGw8=;
	b=X2/IO5g6x+3mlE5ylA26GTtFGF23KNfghKNXVYBpLm0CUpiL6wnbSnWGc/yNvXFwSz
	igKdRm+qwR2gkvck+Trq7pfSaBpJiTJaE/nyxm5rYT2YsbdbX8OlRsK8XTjHO7do9XwE
	BTn6JZJBfsteSJR41MIM3gpOERTO/cJYWd2kZD0fo5yOqILCtCFx0HwCynOfHqwiSM4A
	3PkdYYeGCcmEUEz9Ma5auwMYPyOrrldihSDzedqMVL6LNAhvufI8MbUW/VdUn+J+Ng1m
	SFBYRkMbeYjV0aFeINlqm9xOC/Okp0xlGadPli2dcJ55G4YK30N6UJl/cqc0nMDqmVxp
	pJRA==
X-Gm-Message-State: APzg51DQ2Sc94LQSDpw3EyX3Vi5++opTV1fbcUD4WYTQS+KReYqKSart
	uD3Ky9WF5v6IwJmQ/x8U+jJPd3rhXVau9s2ahgNgG5+i
X-Google-Smtp-Source: ANB0VdZPIT1n16iB2uFV6Zz+tBKQCBuUb/MxjxnHQFZdeyTB3++51qkpQK/cLsujIiNRfI5cYF6LGzxKkGX1VVzGzKA=
X-Received: by 2002:aca:5d07:: with SMTP id
	r7-v6mr8713742oib.146.1536346988641; 
	Fri, 07 Sep 2018 12:03:08 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 7 Sep 2018 14:02:57 -0500
Message-ID: <CALLMt=r-i5AhyYaXon9na0NSky3cvph9ZpbGx0ogeuzOh8pB=w@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: python test files installed in image on purpose?
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
X-List-Received-Date: Fri, 07 Sep 2018 19:03:08 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

We've been running into some flash space issues over in the openbmc
project. I noticed the python.bb file (python_2.7.14.bb for us) is
installing some test folders/files in our rootfs image.

# find /usr/lib/python2.7/ -name "test" -print
/usr/lib/python2.7/ctypes/test
/usr/lib/python2.7/email/test

I'm looking to see if there's any functional reason these tests are
included in the image.

In our compressed filesystem we're talking about ~150KB of space but
right now that's a pretty big deal for us. Would the community be
interested in a patch to not install (or make it an option like is
done with INCLUDE_PYCS) these test files?  Or is this something we
should just handle in a .bbappend file for our distro?

Here's a complete list of test directories in the python package.
./Python-2.7.14/Lib/bsddb/test
./Python-2.7.14/Lib/sqlite3/test
./Python-2.7.14/Lib/ctypes/test
./Python-2.7.14/Lib/unittest/test
./Python-2.7.14/Lib/lib-tk/test
./Python-2.7.14/Lib/email/test

Thanks,
Andrew

