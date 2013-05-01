Received: from mail-pd0-f169.google.com ([209.85.192.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <b08248@gmail.com>) id 1UXcio-0003h4-GI
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 21:29:54 +0200
Received: by mail-pd0-f169.google.com with SMTP id 10so961919pdc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2013 12:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=yExBde/aGTIyDlQY7l3xgfy7j/893QVDoPWyQwUgJ30=;
	b=XrgCqrTuzF0KINFdu4kRggjJxPgnUBY97BFhi1IliMiZfGYUcppNO8vqaNLKCXYw21
	62CM64y0EwlgK4TZr8ed2O2Q2r5aI1EGUteaXKAqa0JadjyvNQ7etOuVO7ageNjDxpIW
	qpSnG9yQxhVIQNEe0I7G4q37SVOB4K8NbvPWXdYQW2uUM0+B3wwEidwrHEgIFfhCONqp
	x0JLqlMyZ8QZpbYXcl8PrQHw1xX4Fa+YKQB27ik9Yggqd3S+bxvfp/2zSZBt5A2Gd5af
	6hsN9AtB/O2T7LImo5oeq8GFttPWFkexMpAqGCbwvXixW5ixF2kjCsr+3HK1ZM7vUt+C
	Besw==
MIME-Version: 1.0
X-Received: by 10.66.144.136 with SMTP id sm8mr6315578pab.115.1367435513290;
	Wed, 01 May 2013 12:11:53 -0700 (PDT)
Received: by 10.67.5.194 with HTTP; Wed, 1 May 2013 12:11:53 -0700 (PDT)
Date: Wed, 1 May 2013 14:11:53 -0500
Message-ID: <CALRxmdD5r1MGDuDjBKHYcB9eLQ1FL9BZM5_QQxLNpQOcyOHvVA@mail.gmail.com>
From: Stuart Yoder <b08248@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: yajl: Installed (but unpackaged) file(s) found
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2013 19:30:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

The yajl package (from meta-oe) is a dependency for another package
I'm building, but am getting an error on 64-bit targets where libyajl
is missing.

I noticed this when running bitbake with -v

> [cut]
> Checking for unpackaged file(s): /local/home/b08248/Work/sdk-devel/build_p5020ds-
> 64b_release/tmp/sysroots/x86_64-linux/usr/bin/../lib/rpm/check-files /local/home/b08248/Work/sdk-
> devel/build_p5020ds-64b_release/tmp/work/ppc64e5500-fsl_networking-linux/yajl/2.0.4-r0/package
>
> warning: Installed (but unpackaged) file(s) found:
>         /usr/lib/.debug/libyajl.so.2.0.4
>         /usr/lib/libyajl.so
>         /usr/lib/libyajl.so.2
>         /usr/lib/libyajl.so.2.0.4
>         /usr/lib/libyajl_s.a
>
> [cut]

It looks like the yajl packages builds everything and puts it into /usr/lib.

However, the packaging code expects to see this in /usr/lib64.  See
this in the environment:

   FILES_yajl="/usr/bin/* /usr/sbin/* /usr/lib64/yajl/* ...

Ho do I get the yajl recipe to either a) build the files in lib64 or
b) package them from lib.

Thanks,
Stuart


