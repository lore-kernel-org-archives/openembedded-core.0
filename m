Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QZGLH-0001m9-IU
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 07:51:11 +0200
Received: by fxm19 with SMTP id 19so456976fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 22:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4u/Ejk81R48NC1YEPlHETwu0uwX9DVAxnH/Y07nIUYc=;
	b=vxRYLin4F7WvNo1DWJ58DOiUkbMbtMkidG8VFvZ27tupO+59s9Bu5/uG0GPFbmt/d0
	SZuFUTHAYH59X37e0OsaYZoW52mT/pq1wXExA1YTIsPoCuY/v2Y/wlbPmkBdbVoFj0wO
	9gCDO8V/cBCc6c8u1Mh6YAeZ/tl2BR6z/YB3A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=t5/xzRhvGpwMLeNObCi6glilLAxaR5aC04fpPwBOtlPxQ+Jfu5mfPvIpbQn2Ii35S7
	OTxlteg8jcClsmUwXg5379zcEV7Bg71+12GuiGdUX8/fp0dCei2DEj5ZvnxRe8jSmPjq
	kYoAam9BHNK9D9JXN4Xe3lGcuxt96Xqd/juUg=
MIME-Version: 1.0
Received: by 10.223.100.15 with SMTP id w15mr335921fan.11.1308721657267; Tue,
	21 Jun 2011 22:47:37 -0700 (PDT)
Sender: anders.darander@gmail.com
Received: by 10.223.114.1 with HTTP; Tue, 21 Jun 2011 22:47:37 -0700 (PDT)
In-Reply-To: <4E010CC4.5010906@windriver.com>
References: <4E00CA30.7020302@windriver.com>
	<1308682643.3083.18.camel@lenovo.internal.reciva.com>
	<4E00ED2C.1040708@windriver.com>
	<1308690566.3083.75.camel@lenovo.internal.reciva.com>
	<4E010CC4.5010906@windriver.com>
Date: Wed, 22 Jun 2011 07:47:37 +0200
X-Google-Sender-Auth: 6wkrGGqU8JxFbtLi9YTcV-NhCK8
Message-ID: <BANLkTikrzRcqU+e_G6=KbOSjvdi8kNRmSw@mail.gmail.com>
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Directory permissions and ownership -- RFC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jun 2011 05:51:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2011 at 23:27, Mark Hatle <mark.hatle@windriver.com> wrote:
> Note, there is one remaining issue that I haven't resolved. =A0A few dire=
ctories
> are defined in terms of symlinks:
>
> =A0/var/cache root root 120777 volatile/cache
> +/var/cache root root 40755
>
> =A0/var/log root root 120777 volatile/log
> +/var/log root root 40755
>
> =A0/var/run root root 120777 volatile/run
> +/var/run root root 40755
>
> I'm not sure how to resolve this. =A0If the package(s) that define them a=
s a
> directory are installed before the one that tries to make them a symlink =
into
> "volatile" it will could cause a failure -- or at least different system =
behavior.
>
> I'm tempted to extend the fs_perms file to include a way to specify symli=
nks..
> if one was found then the recipe's install would be modified to mv the di=
rectory
> to the target of the link, and add in the symlink.

Yes, please try to find a way to extend the fs_perms file to include
handling of
symlinks. Otherwise we are bound to get problems immediately...

The outline of the symlink handling above seems to be fine, assuming you fi=
nd
a good place to hook it up to in the tasks.

/Anders


