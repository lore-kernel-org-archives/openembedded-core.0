Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id A160D61809
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 15:18:36 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id t26so1730141ios.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 08:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=E4GVqSI23w3IsCB7XC60NKxzUY0keeF9CqWEP8HRPGY=;
	b=mt08MMdDuPTu4CSBYzxPjUJVP+Ffj7Y2V311jHiTWkqM8e25nTSLK4bWWTur0Hvfex
	wqPpNSaganvgKGtTOY/a1d/fgbTINSfFt3F3XMrDIKOps1i00RtRH5F8ZUwDafup12II
	vrAlEPe7m+vvwlJvrxIs9L7L6/6rTIH/2jdGVk4AcxmTj6ILy7ci5elh+iRQyrODBjDy
	hjf9Ou3gAXTePDwD8weUYpG2BtoKQOmaRT3Q4h75u2LSXbrg/rNAWlXHsRVTSrW3f8M+
	2S9R1AByabIssDxgNeKjPqAlOyDY+7jenD7wPmvd4wAqWNncwZOM6CvYhcysD7hTm1r6
	y5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=E4GVqSI23w3IsCB7XC60NKxzUY0keeF9CqWEP8HRPGY=;
	b=OPg1Ytd4dcXD5HOpPYlRqJpUL5Pb9dYXC1UWdyBaRAFE+KqkQu9jnHFaHrF+p4tYLG
	SdwOWJ3wuaOxYJWs5O0jbzdbnDqG75FUpq4v8PLYHpM8SD/TERRy+tO+cMotq/xKLhcb
	/WRO2NcKjxgeH0QtCAIaAJWsi5RW01B0rX5CcPMENmF4XPTQ9bozP9Od9Zx1b+JolUoT
	6iVkS3Uff2TOfZurcpDkZ1gfD6L3cEsvX6IJSsPwjRdge8hksT/+McqiCwvy9Eo8r3y9
	YZw+bTOU2x2hnRsGflOI8GOsfY4nAOxHyvK8uP/qubQKrQ2sdpJg1gPDxab9AfaCpR1W
	vD7Q==
X-Gm-Message-State: ANhLgQ3Tq+Y+/cWk7OBxROwF6UlCn38Xqo8hoGHWtMvmX9yAHh942kbj
	W2D8xauQanIPv0Mjrrqj393KBkNKOthQGy80fF1SDq/z
X-Google-Smtp-Source: ADFU+vtc1EL6jEXsbrozBaQSyM399ieUz+TAmNYFZ9AxNhn93lr8EsIXh7BXVB+EDYzIz9s79GRv1+sdr8OXr93xSwM=
X-Received: by 2002:a5d:80d6:: with SMTP id h22mr14094006ior.129.1583767117256;
	Mon, 09 Mar 2020 08:18:37 -0700 (PDT)
MIME-Version: 1.0
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 9 Mar 2020 15:18:26 +0000
Message-ID: <CAO5Uq5ROxZsnZxJd=a6vUJTmAnMLb82XJmxjJYjiBjt24ToC7w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: psplash activation state w/ systemd
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
X-List-Received-Date: Mon, 09 Mar 2020 15:18:36 -0000
Content-Type: text/plain; charset="UTF-8"

I've a branch with systemd 245 on it which fails testing because
psplash gets restarted all the time.

But ignoring the systemd 245 piece, it looks to me like psplash could
be restarted under systemd 244 too as the main process exits and our
units aren't marked RemainAfterExit. I haven't figured out what's
triggering it in 245 and not 244, but I suspect it's something similar
to this:

https://github.com/systemd/systemd/commit/9fd32ff7d363945fbf8fdae0128702b995127558

Given where we are in the release cycle and how painful psplash has
obviously been, I'm inclined to leave it until after dunfell ships and
then do it as part of the whole 245 upgrade?

Equally if you see psplash flapping during tests, it's almost
certainly this problem.

-- 
Alex Kiernan

