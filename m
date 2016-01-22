Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7481E6AC3C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 09:50:16 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id q21so83059339iod.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 01:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=LMyiY0jFy9jmiv8WaYSQ3LjrZpM17oZv2ZsPlDd83CI=;
	b=DnEko/ij9zwCpUJbiEv96C+qxyExBss6T0B8PwWzebhri9z5o3646ipFaTFPePlCJf
	zydyrVZNoah3yRZXO39aMOOdnmvS+ufnr/9WsHzQqPJLRk5hWp+bL0q5fH/70ACQmwwi
	d0eOmIrmiVLYbvVXv1u2zEj146V5q7hUssppvAB8GEnUBHjtZqNL055vUPfFtFHZ9Pdw
	QclC1vkTU19l+kj2+m+ZVu4SxcD+BJgMVEp5I1d0GaqeLECNKqUPPzGZxc5qD7QTmxL3
	pZ+eKzZhhy7Y83dxs6XgYqQK07uCyOE4U1KeAgw9WCUlA/J266+Ow0K9hJ2H7t7fd/pL
	zbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=LMyiY0jFy9jmiv8WaYSQ3LjrZpM17oZv2ZsPlDd83CI=;
	b=AUmORu31f6ZOqY5Bq7BQ0m7WkFK+FT5OeNWP8EiBSPDJBuF60fLmQwIbwrz7X67i7+
	TOd7FDiNnEZqQ0nTVc6k4Z56bVqXaUPLtVwklnYZGQiz98S9eytl5P4aA0I5V2NX9bbK
	+GBkWywz9Fe0ZojCjWm61yrAA8c6onXhD7GQ14S/CGvVvOo1/HoXuXy3XnxjksipeJ18
	HM6RgwMwdA/66iEwdm0qg0hEPmXHghGk0D7klHTjRr8jYvmWGrTy28ZcgfUpVtQ0Xv2U
	zwrVQ7Jxxnxk8fVBcYIhDNijbEbtyA07cHzwzcHbgBJvycUeRIEdbbTnhC9671BIzCP8
	AiCg==
X-Gm-Message-State: AG10YOS8CiR69rH61tynqSYCcalKffS0kBWE0X1kBkH98oDrZvKBFY3yewpyNMVWhtWKzH4DXVL6GBwjBlHj0g==
MIME-Version: 1.0
X-Received: by 10.107.3.154 with SMTP id e26mr2489147ioi.99.1453456217499;
	Fri, 22 Jan 2016 01:50:17 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Fri, 22 Jan 2016 01:50:17 -0800 (PST)
Date: Fri, 22 Jan 2016 10:50:17 +0100
Message-ID: <CALbNGRSZ+edCEyGJzWbkniTkds6M=PqF3_gD65=fO0JiYOELBA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: opkg pkg_prerm on package update
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
X-List-Received-Date: Fri, 22 Jan 2016 09:50:20 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

although opkg 0.2 -> 0.3 is long ago I noticed a change in behaviour
when updating a package:

* 0.2.x did not call pkg_prerm
* 0.3.x calls pkg_prerm

Is calling pkg_prerm a valid behaviour when updating a package?

Why I ask this:

systemd.bbclass does

* stop a service on pkg_prerm
* restart a service on pkg_postinst

This default causes trouble when updating displaymanager within a
X-session: Displaymanager is stopped - killing the update process...

For opkg 0.2.x a workaround was to override pkg_postinst avoiding
systemd service restart. This worked properly for all my use cases:
update / remove.

With the 0.3.x behaviour I can help myself by overriding pkg_prerm and
pkg_postinst but when removing displaymanger it is not stopped.

Thoughts?

Andreas

