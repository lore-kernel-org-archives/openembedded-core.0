Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web12.54637.1585585617085060295
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 09:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=dQqjAowy;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.166.194, mailfrom: brgl@bgdev.pl)
Received: by mail-il1-f194.google.com with SMTP id t6so12799746ilj.8
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2020 09:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZgDKQmW61a6Dgi21AWbNyWiAHJtsxiEo1tdWAO0ETAo=;
        b=dQqjAowyrLprz9Ix9/ZglIIeRmVHZZd2Jo9fyF3IISX7ZKX+3D2Set2WOB8Ibvb37k
         RPW+gqLoshQVbcDq825rmEY+ULAoHnVixw4bvrbTYuAwt11220i3Bvh441pSlygR1jC/
         647+eAYg5e4SFLELJnoUWqSWcLK2TeDCNdjquxWff0mSLOixff/ie8t2w32jw3ch+Mpl
         C7/ISFfGhxED8uva0qGgYt90K3WHC3WQjMongTirzp/sUknKYcyUK2BjFLo2ABVLtxcy
         MtmVX2UJPsxAyXv3v7Y8av67ITZN2bRXAP55IFMow5tEExKUV7Mlfo/HDecHNEMZiNrm
         MnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZgDKQmW61a6Dgi21AWbNyWiAHJtsxiEo1tdWAO0ETAo=;
        b=PhtZsxI7WRseUZbftrUNFlOMnBkpgaBs4xBi0NU305LuVwBrDCW1fp1AGG2ByYJQp1
         I8cR1oJF75q2EJZ5sGAtDkV0wxu5u6v2qYkiALaHo0tsy7Mp8D98ZsZSOe/FA8HqEy2O
         bAvJsN2coHC/kqg9qQJCOrOBCK9vTQoo3ICLoK0eVmwLcFmPSnqSbI6VGF/nkMrCxydn
         vPcs3fMxpkSW4QIWs2NCdU5gXoT6Bkr0uXcvJkMaoJvQjmP6Lch4BjlAUdE8fnmenZAT
         JENpxQrRCkBxrSAKJKIiR2kMnULNcjxNwfDLmSHxQ+wllSQU8FxuJwjSAOggfzKnICGM
         Dpmw==
X-Gm-Message-State: ANhLgQ0wL0KcQWKpMJtrNwtmxZ7gOW2yzxQttrAfF3J5EhS2SvU1ql+u
	6OhBYspUtakej4QKi7cAytk28E0StVOUW5QeTEQ38g==
X-Google-Smtp-Source: ADFU+vveflprwecBKpc8rY+Pf2l9YiKChHC4j9KkEQchGbxTm+69+YSZJCCVxStWm2jdVz8abC70IYuFJe7rdyG4K3s=
X-Received: by 2002:a92:af8c:: with SMTP id v12mr12793918ill.6.1585585616428;
 Mon, 30 Mar 2020 09:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200323172808.26338-1-brgl@bgdev.pl> <20200323172808.26338-3-brgl@bgdev.pl>
In-Reply-To: <20200323172808.26338-3-brgl@bgdev.pl>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Mon, 30 Mar 2020 18:26:45 +0200
Message-ID: <CAMRc=Md2DfUTEhR-DzswDc=LQSHdJ35NMeQCVMJ_qC7V_4jiEw@mail.gmail.com>
Subject: Re: [OE-core][RFC PATCH 2/2] image.bbclass: deploy image artifacts in stages
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Armin Kuster <akuster808@gmail.com>, Jerome Neanne <jneanne@baylibre.com>, 
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 23 mar 2020 o 18:28 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(=
a):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Make each IMAGE_CMD task an sstate task with its own IMGDEPLOYDIR
> override. This way each generated set of artifacts is deployed as soon
> as it's ready instead of the do_image_complete task handling the entire
> deployement. This allows us to better fine-tune dependencies e.g. we
> can make do_image_wic depend on fitImage task which can in turn depend
> on do_image_ext4.
>
> We need to completely delete the do_package task in order to avoid
> problems with task hash changes as well as delete the IMGDEPLOYDIR
> variable from the data object passed to each image task so that it's
> expanded with the correct override.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi all!

It's been a week. Can I get some feedback on this? Is the idea at
least remotely acceptable/can we build upon it?

Bart
