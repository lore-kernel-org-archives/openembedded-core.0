Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2401CA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 11:27:59 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.36788.1756985269999614105
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 04:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DmFQifzr;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-7282a09a72aso7018076d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 04:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756985269; x=1757590069; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bkNDBwYfr6oCKeNY/lcU1DZWb1bJaqMSX4ModxEN+Xw=;
        b=DmFQifzrpEfI13qWF6bQYc8Z4N5uWS7uLFUX5lgNGcUU4T/EJNPJe8rPKsi+Cfqv+Q
         djBK9cWBvfxQFdgA+oN3+TNdeTUhW2znidywkiNlmjoQQd0B5KUaB/CPSPP3ZQsd+Ght
         dBqN2QItjakurckCAjaJyZHkJ6A03OFKuZYkR6JTklCPBNXvkQUjozPBCJ8fPjkR9Jof
         4DfGQM7kfcXLd7aj61hyA90eTnoble/gQtHVGhuX8dXCY7HhCaTCDA2ZnXsUZ3p5N2J5
         32lumnqM36tE0yIUtGdFWoBKdSIUuqZ48ivuZSAlZIPfKZJ1A8/mJRSfGbd3YeJUkLQX
         dQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756985269; x=1757590069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkNDBwYfr6oCKeNY/lcU1DZWb1bJaqMSX4ModxEN+Xw=;
        b=WNVV2vEyAugktrJkNR4JSmx9N5TzBrg22xq4EME2vE2ezYBztWS6zWTbyUo9YXqwuG
         rlJx1NjOgz2sRGhft7pQqvhlUKIbZRyeYk3RkyeS+7gQA9O0eov6IQrjOyYKz5uj5S5l
         UeaQXSHQBmFeShs0h+NPsH0BkLKfhOvFUE/IkA3T4HbJ3sos4zz/Z+GIOpUPQ6uwXYl9
         ukiYcXCikaJ8sM31YkVfiSES3zfnEJT0mie1/yn3QFtyvnRnouzwabERSxc3IfCJHYDk
         CB1fbJTCUMmbHnxJVL651ivqgg1ndaUTYC7bCI1e6HHJnWWQCrNB19jM+tNi6gy5WRYT
         iDvw==
X-Gm-Message-State: AOJu0YyfP4oYNvuGb0t0zv1rrNewCS6xbcNz4sEwtN7B29SkLkgduDML
	ELJgEzQntZACERHZjOV9psmQgGjSElHZqptKat0hJ8AHcdjwQZzZ7X47WvrvbxZ2Y7Ho2X3ZvPo
	rE7pIjIVL4xfxDnXXki9TAfXV9NYvrBw=
X-Gm-Gg: ASbGnct0cl35UsItFEIQ3qPGWi98h+Y8VfidPFjN8WlTuP6hSHP7iLeBrEh3PqbdJIv
	ejcLGQHFT3ldI71O3XBv1i9sBp+W2dWfYpIqxpXGjc2/IgILwRFya44omHNuFvjhrnDGBey9XlX
	6LAYMXSOyw2uTcLSSrMEd61+KfPYvKfMBOYFN85AIzgTSs5xsv9Dwg9OHN+2Hd7Q+3Czhcur1+x
	11Xa1ZVTut6G8xTLNkUn/mbrw7vF/R2yV/A/PHnFVLu2RfEC1LZCtOWotpxQHhh/SutOh9b1rEc
	Fx8LWd8n7L6N+08mttpSKHw2DRSh9vGtxjSzjaqQZ9KRKxD7x+A=
X-Google-Smtp-Source: AGHT+IEIlR/YhoUtroyB/JJB/exC2AXxiD3G8OUmgKdzUVM0vszghi4YHcKy80TDTg6C75yW4HIUYA7tCNV5gd1pt4o=
X-Received: by 2002:a05:6214:21c9:b0:72b:1221:fdc8 with SMTP id
 6a1803df08f44-72b12228cbdmr1143526d6.46.1756985269013; Thu, 04 Sep 2025
 04:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250904000724.1575300-1-a-christidis@ti.com>
In-Reply-To: <20250904000724.1575300-1-a-christidis@ti.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Sep 2025 13:27:37 +0200
X-Gm-Features: Ac12FXz6454Fhu_bi-M-NctvDwMiQman3Q4wlNlvD70WO5UzoF4IhqFcRqXheyI
Message-ID: <CANNYZj-e1eYKD4Se3mHOWO-K5kA1BL0rSc25MPTNcuupa_hykw@mail.gmail.com>
Subject: Re: [master][PATCH v2] libsdl2: Add tests package and ptest support
To: a-christidis@ti.com
Cc: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, alex@linutronix.de
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 11:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222920

On Thu, 4 Sept 2025 at 02:07, <a-christidis@ti.com> wrote:
> +test_array="testdraw2 testgeometry testsprite2 testgles2 testoffscreen"
> +test_path="/usr/libexec/installed-tests/SDL2/"
> +
> +for test in ${test_array}
> +do
> +    timeout --preserve-status 10 "$test_path""$test"
> +    if [ $? -eq 0 ]; then
> +        echo "PASS: $test"
> +    else
> +        echo "FAIL: $test"
> +    fi
> +done

Hardcoding a list of tests is prone to regressions and incomplete coverage.

I applied the patch and checked what actually gets installed. SDL
conforms to gnome's installed tests spec, which means you can inherit
ptest-gnome, and run-ptest should be as simple as:

#! /bin/sh

gnome-desktop-testing-runner SDL2

There are examples in oe-core if you need them for reference.
Obviously you should run it too and check that it passes.

meta-oe has a recipe for libsdl3, whether you want to forward-port the
test support to that recipe is at your discretion, but at some point
libsdl2 will be obsoleted and replaced by that in core.

Alex

