Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640BBC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 19:06:05 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.6629.1744311960032525100
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 12:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f2LN8j3e;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6f0ad744811so7474956d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 12:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744311959; x=1744916759; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oU8TGUsLb2sGUg0KdQmo0EqDfXun9l4piKNPyJDjQ0A=;
        b=f2LN8j3eZ9uit9OxjttVV0DoxMEA3iSQPFv+NGjzFFTWqIvGtwGui+tCH5RT+dARM4
         or2NWpuiOfzizBM2Az7rCqA3ZG+712zAcoX3sfAiZusdPshvQK1PdWybWodxNEFuyJ6b
         pasxL8UyBgxUN6fnVnYBJwz/JgL2c97nW/d4uhUGZMH6CyeG5lKpUfM8TVtifz6nLuU5
         00EGPY6+gZJeGBgfW+NZ+G0aB5h0xlNZfGKCZ0GiYFS7wnTRfOkXO417A7UlHyeuonKu
         mKYGoR7qOihNktBQPVR51EDlBkk4N/ZPvUycziL6eElCwfI7THiXqhxZMpnfPawdgHkm
         Kglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744311959; x=1744916759;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oU8TGUsLb2sGUg0KdQmo0EqDfXun9l4piKNPyJDjQ0A=;
        b=h3IvfJU0geiZlL5DgvloMjq0t9neENhCqWWHpAl+NqrvIUBAiIUKEH6HVk9T1GoSoP
         XfLrqikLHxrD7nQ27Eg3yy3wBqyffR1zJiot8eIum9gqG0lBsNzSc5OzyHg1q3HgTRHB
         vUfWO8jq3hBCZ2pztDIzdZRQDTS4fKo3L5YPcv9DMM2iIK7rvGY71H/kA6mdECb11tr5
         NVBqVk2L25YWuYTwh7XgaXpQcupHdVgKWWURQtUSYb04imWJoMRB9p3Q7sL9SNilRR4p
         epSrXWUeVm0Ib/Vxgy99Yx4rK1nxf5XTR6Ej43gMKO7QpMpNeCGH3173/awZ7pe4FDgn
         721Q==
X-Forwarded-Encrypted: i=1; AJvYcCWv5ooqEovNKsYMps8ZQ04eY8G1jSWeobmNM2MRwH38A4pHo9VggUFOnk3Tm1AMsLM9xtPNwz7uiBquTrCmrjQBJQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxi8mfajXLoRwhxYsp5XocPOXq3P9swEzLD9TYUH5GRWEYKm6W2
	VJkS6qdyLPbsZAOcI9h4hLB+5wnCiGjhdwgy89Zqvz0C4xjcbNVNdVE6aRXz+FfSnM5himuEZX9
	cRSxeBYXdxb82eIRFX/ceExDYSS0=
X-Gm-Gg: ASbGncukC3qQPBwLsCnaMPp/ve3zAORhikiT2KZFvCZmwdIx5mrjN1E5oRjyYnbbS3A
	Jqq7vSPKwquxCFFzaVrVech4wl6idLaXMi4ywOe+TiQtHLrMu1gE2gi3GMuHNlCTA9hXJwYEqaz
	t6U/LgK6qgS6tvL5z4ldIO5lu6ovntiQTRpPBlN6x3EEfaAbEzspWF8E3F
X-Google-Smtp-Source: AGHT+IErTlOTK1QAExP2n8pXM6HH4AdGXsMck5h8UmTAu0x0Ub9eLin+A7WLjlwcW1yJgv3Noa6uTw/TQMYsYArUWMo=
X-Received: by 2002:a05:6214:2509:b0:6e8:ff18:9424 with SMTP id
 6a1803df08f44-6f230cb080fmr511656d6.5.1744311959075; Thu, 10 Apr 2025
 12:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250407174904.1191173-1-jeroen@myspectrum.nl>
 <a0573ce7a2fe28ee7ec138194177c09dbc53283a.camel@linuxfoundation.org>
 <ecc77fe1-4e85-407c-aa6e-e4b8dcb6e96b@myspectrum.nl> <687a5c15fb54930b999cf16a59baaff8f9897a94.camel@linuxfoundation.org>
 <7eb23b12-1fd1-48a5-83cd-eab2edb8777b@myspectrum.nl> <CANNYZj-+Td=3EtykeKT3mEq-0c6Ue5EKQ9if_3OCY3TrxTPUJg@mail.gmail.com>
 <CAMSfU+4QKpU=2YaO8L03R+aBzByUq=x3h-sn8yy3rRCxX==YmQ@mail.gmail.com> <8eee9b46-7e9a-4c1d-8daa-4e58a135d9eb@myspectrum.nl>
In-Reply-To: <8eee9b46-7e9a-4c1d-8daa-4e58a135d9eb@myspectrum.nl>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Apr 2025 21:05:48 +0200
X-Gm-Features: ATxdqUGt_9aShODYzjXc4wOvbKOROPajNIeKlIBNhhfVRcEvuhIEiZ7WX-lMTps
Message-ID: <CANNYZj-2ujd+dc=sxpKy4nsy-MN7N3RQxyjfaX0_=RLCm3DUOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] udev-extraconf: fix ifupdown for non hotplug devices
To: Jeroen Hofstee <oe@myspectrum.nl>
Cc: yoann.congal@smile.fr, richard.purdie@linuxfoundation.org, 
	Jeroen Hofstee <jeroen@myspectrum.nl>, openembedded-core@lists.openembedded.org, 
	Jeroen Hofstee <jhofstee@victronenergy.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 19:06:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214699

On Thu, 10 Apr 2025 at 20:33, Jeroen Hofstee <oe@myspectrum.nl> wrote:

> Cool, let me know when these patches have landed.

This probably wasn't clear enough: the expectation is that you write
and submit any needed changes to busybox upstream, and once submitted,
propose a patch here that adds them to busybox recipe. Otherwise it is
not going to happen.

Alex

