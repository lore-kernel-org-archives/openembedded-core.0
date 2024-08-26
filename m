Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFDFC5321E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 08:38:09 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.48723.1724661485169008973
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 01:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z9Odvva1;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-45327512c3eso22391031cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 01:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724661484; x=1725266284; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H+mkFmW8LC8LCBiVprEXBC6feQvUvUBuT5K9HkJvlXs=;
        b=Z9Odvva1iJL5LfyNvbcGZyY6+O5XEsNb0phlFhNJcJ7SlYwshJol9J+cKdY4FtfSJ1
         18WjIOGHXd9pLc+e/W9EdJVzNhN/f+ad0+vjZrJpohDAPYilKKBAOJOV3pnRgo6mW6zv
         Qyw4Ae+D/yUuDUApokVWhP0c/9hmtD/UOY1ZHUsxYAs0YCiT0rnpmRWH/0TiKu2PgMVN
         dZ4Z0eLvuI8XnA3fdLdhVOM669afvK1BYu+bUZP5WLQssX0rIb5BhyJV1feFEYoEqMYv
         ur4Z3oSCW+A4fqqr+jPX9ZiV0h9n4qXe5aDXkTbixNiU0SSw4ZIHfOkDnrl+R90A0Jlw
         fc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724661484; x=1725266284;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H+mkFmW8LC8LCBiVprEXBC6feQvUvUBuT5K9HkJvlXs=;
        b=ejOHKTBzSL0ogdciKUlOLcS8Nwai2CsT5zemPj3GkE+99tJk7ZtEMSsnmzMMk30CS4
         c/FgaXsS/u5Kb0OBDiJbamkkwTvOsQ1Jae6iTeA34PKdEqfeDbR3nm+dG8Cs5N6Siv1U
         1BgXgQL00nkugVW7lC8gW0uEFzWk8ssIVKLhW7Cto9pVHacLU1h/2ZV6Xyb/nz9kXMd9
         1+T9ktbOkVowoUxRCrXF+4TcQEwBPxcZa3Qu0ST3fHdftC1qfAU9ktGXv/6fpykyEJdX
         Mi4QPsEoY5hQu3T0dcEOjTgP6M/WFCLYs19Wky9f+aoQEnDTOMM5j2jlj52Iqli7VUtp
         M0pg==
X-Gm-Message-State: AOJu0Yz7qG0wDKYJ0TkrhvPwpfyf0HCqPONezW9MxntOALkTzPoWhurS
	Av+oZPm8FTYppT86DdfuNekdrV9ulAdxrAsWeRh3+untretCbp8amRqSxBCLdO/0vUiQ5mCGCTi
	0Cb5fKjpBUq9tk8koaZQsivK1bD8eZjpt
X-Google-Smtp-Source: AGHT+IFie5nQT14D7jRubvX59ywMlmyWXZSZECnG5coN5UbdgfbS8pKSFk/s6Xf4WC+KXcxEsiypP/8Jeyd6BBEjoRc=
X-Received: by 2002:a05:622a:580f:b0:44f:fb58:8c49 with SMTP id
 d75a77b69052e-45509d03982mr132330031cf.59.1724661483953; Mon, 26 Aug 2024
 01:38:03 -0700 (PDT)
MIME-Version: 1.0
From: Claus Stovgaard <claus.stovgaard@gmail.com>
Date: Mon, 26 Aug 2024 10:37:53 +0200
Message-ID: <CAHirDJ8tUihjou3-4qirjk1vGVTXVrRg+TjKxmu2qvOtj2EVwQ@mail.gmail.com>
Subject: SDK in scarthgap after package_manager: Change complementary package
 handling to not include soft dependencies
To: oe-core <openembedded-core@lists.openembedded.org>
Cc: Andreas Helbech Kleist <andreaskleist@gmail.com>, Ross Burton <Ross.Burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 08:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203738

Hi folks.

I am working on upgrading a project from Kirkstone to Scarthgap, and
hit a problem I would like to have your input on, regarding the change
in Langdale to not include soft dependencies.

The background is that the project has 2 teams. An embedded group for
handling yocto etc. and an application team using a SDK created by the
embedded group to create applications.
As the applications has dependency on libs and utilites from the
yocto, and we need to give the application team a SDK so they can
incorperate the change in dependency before creating an image for the
target, we have used "dummy" packages.

This means that we has the DEPENDS located in a include file, and have
two recipes including those
* dummy-app.bb (used by the SDK, and is just an "empty" package with 1 txt file)
* the_real_app.bb (used by the image for target)

Until know the SDK has included all the packages mentioned in the
DEPENDS, but this is not the case anymore.
In process_depchains - we have the pkg_adddeprrecs method updating the
RRECOMMENDS with a filtered result from the DEPENDS.
And RRECOMMENDS ends in the recommends for the rpm file - not
installed in the SDK after we are not including the soft dependencies.

As I don't expect to be alone in needing to create a SDK for some
applications, where the applications and the DEPENDS changes so you
need to create the SDK with all the dependencies for this application
without the application itself part of the sdk.
What is the preferred way of doing it, now soft dependencies is removed?

A workaround might be to hack the RDEPENDS for the dev package in the
dummy-app.bb - something like

RDEPENDS:${PN}-dev += "boost-dev cli11-dev ......"

But I don't really like it - as the DEPENDS does not really fit 1 to 1
with this.

Any input on this.
How do you designs SDK's for applications, where the applications
itself is not part of the image. Do you manually add to the
TOOLCHAIN_TARGET_TASK or similar?

Looking forward to your input

/Claus - A.K.A frosteyes on irc

