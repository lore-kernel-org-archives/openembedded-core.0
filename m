Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 69F0E78A82
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 17:26:15 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id k8-v6so5706242uaq.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 10:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gUlRs6K8liz2E8wukW382v+GAYSsKZ1mt40SqxFoC4M=;
	b=ChXPFmYGXm0wlLyvsShFLtcJekZBRrm+0Fs1S9/78NURB0w7AURFzab6ASfkcYmtHP
	tOjGoAiKo8m08Mkl68Tb1aFFGKVPCpR8am+Q3y74bp/AN/Ea/nuN9KKqwFhqUMnLdoFB
	i8VWoYn3xRn30cjnzpfF9muJ6vIo2hRudR0avmuESIsaKQJPYEKgxuIsOicykL/8R+j/
	Zc0v/fPzB7LfTykOhPJxYpLijMZGh0+dpyTJD48pMTN1XG71AUfYy+nPJ804YqQ8uOuG
	xMoN0PTKPnoVUcBo0BhBN3UnU1v/5ZsLioIVyH75J3bTLLO5rdBwdt37unWNQ0xMBHFS
	HT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gUlRs6K8liz2E8wukW382v+GAYSsKZ1mt40SqxFoC4M=;
	b=ZxK1EVwHNgxkQGrE/qzsNWo1RwVtmi0+E1poLa4ojVmorxKVsc3NBI7XzIW0OdJVPg
	4MVpR6wIfNy6QnM6RSE7CFoNxWQKKYhZGToGAHX7mlGgr05Ka0Zzyy6a75eHALNgKH24
	+PhjPSFej7IMphs8gxnL+GbD4GxLdYtjquz1YMPPs2m77fkQQqvKnn94YNC20pKW49Qx
	WoxT1VxwLvcHUYrQcaWpVwrWy0TKu7mQ2C8M2/OFSwyp8Wv+AaT5Q/eD4iERtde6xOnk
	2PD9F5EO6t7r5y1OA7P6hQFTtqQbQjAxyd+zwJJ/p3/UefDMRQMKjt+FsrhoTzEMmaNU
	5+jA==
X-Gm-Message-State: AOUpUlHRg4tQyUIdVJg3KvPHB3nXoJSIV3tOayK5wK2omMhaII20FFUr
	V3pNhArIimS0TkG/z9ajfF3457CMU1GcBJrVJ2k=
X-Google-Smtp-Source: AAOMgpfOLD2liNmf3PfXS//qNdTukpmgMEiiVT+9uPrZxOAT003DLpoTWFIQg4Pc1kxvjAdVwByJ5/aTBYFnvBNQnDU=
X-Received: by 2002:a9f:28a4:: with SMTP id
	d33-v6mr7230629uad.11.1532021176346; 
	Thu, 19 Jul 2018 10:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <1532020379-32243-1-git-send-email-alex.kiernan@gmail.com>
	<096e8a04-c49b-88ae-df8e-444cf4c33c94@gmail.com>
In-Reply-To: <096e8a04-c49b-88ae-df8e-444cf4c33c94@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 19 Jul 2018 18:26:05 +0100
Message-ID: <CAO5Uq5SBCQes7uM9sg=Zy847nKWUzB43zqJ8VRQRxj7qfzS8-Q@mail.gmail.com>
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image: Use ${COREBASE}/meta for timestamp, fallback to bitbake.conf
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
X-List-Received-Date: Thu, 19 Jul 2018 17:26:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 19, 2018 at 6:21 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 7/19/18 10:12 AM, Alex Kiernan wrote:
> > To handle the case where ${COREBASE} isn't the git directory, but
> > ${COREBASE}/meta might be (since that's the layer that sets up the COREBASE
> > variable), use the timestamp from there. If that fails use the timestamp
> > from conf/bitbake.conf.
>
> whats the chance that ${COREBASE}/meta might also not be a directory
> under git when compared to ${COREBASE} ?
>

About the same I expect, but if it's not then git will climb up to
${COREBASE} so I think we're better off.

And if it doesn't find one then it falls back to the timestamp on
bitbake.conf - I've just been testing a snapshot of the layers as a
tarball and building successfully inside that when there's no git
directories for it to find at all.

> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >   meta/classes/image.bbclass | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index adc50c9..0afebff 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -651,7 +651,10 @@ POPULATE_SDK_PRE_TARGET_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usr
> >   reproducible_final_image_task () {
> >       if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
> >           if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
> > -            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}" log -1 --pretty=%ct`
> > +            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}/meta" log -1 --pretty=%ct 2>/dev/null` || true
> > +            if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" = "" ]; then
> > +                REPRODUCIBLE_TIMESTAMP_ROOTFS=`stat -c%Y ${@bb.utils.which(d.getVar("BBPATH"), "conf/bitbake.conf")}`
> > +            fi
> >           fi
> >           # Set mtime of all files to a reproducible value
> >           bbnote "reproducible_final_image_task: mtime set to $REPRODUCIBLE_TIMESTAMP_ROOTFS"
> >



-- 
Alex Kiernan

