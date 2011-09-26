Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <swaplinker@gmail.com>) id 1R8LAf-0002HO-LY
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 02:05:14 +0200
Received: by vwe42 with SMTP id 42so5419277vwe.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 16:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=CiWLl5Pw5RRb4eknMsMI5Oa4DuldLRP9E5PDJ625Nhc=;
	b=UbbNcsJpCmXV60jrYmJih7iAEbEtZ6ZKvTIDY8wj/nk3o0FXJQYCIimxj7t9q79emn
	zZ2gYfgS/zWHSDV2Tt2hvCPZAEdJNRmhmqbnK9fu8PfyIq1WFOlpNld72e0LjpUO8usY
	L/lawL1RdqKr2N4iIfTaZG9oHc2tHWR6ZPTbY=
Received: by 10.52.22.74 with SMTP id b10mr6856754vdf.90.1317081588276; Mon,
	26 Sep 2011 16:59:48 -0700 (PDT)
MIME-Version: 1.0
Sender: swaplinker@gmail.com
Received: by 10.52.182.138 with HTTP; Mon, 26 Sep 2011 16:59:28 -0700 (PDT)
In-Reply-To: <4E810D02.6080101@linux.intel.com>
References: <1316955346-12756-1-git-send-email-julian.pidancet@gmail.com>
	<4E810D02.6080101@linux.intel.com>
From: Julian Pidancet <julian.pidancet@gmail.com>
Date: Tue, 27 Sep 2011 00:59:28 +0100
X-Google-Sender-Auth: KueBydkeelVJV-mdhbg1gbiAvA4
Message-ID: <CAKZ=5EV1JWxf4MaMmHNNkvZDa6OmoLTqThUuteuG7zOxJkFPxA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Use useradd and update-rc.d classes in the OpenSSH recipe
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
X-List-Received-Date: Tue, 27 Sep 2011 00:05:14 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 27, 2011 at 12:38 AM, Saul Wold <sgw@linux.intel.com> wrote:
>
> Is there a reason you did not include the group and --disable-password here?
>
> I think it would be good to leave thelong name options in also.
>
> Sau!
>

The -U option creates a group with the same name. The
--disable-password option only exists with adduser and is default with
useradd -r.
I'd just like to point out that adduser is originally a perl script
from debian and reimplemented in busybox. The options it takes are not
compatible with the more standard useradd from the shadow package.

For some reason, some long options like --system (which is supposed to
be supported in useradd) did not work during my first
experimentations, but I will investigate and respin a patch with long
options if possible.

Also, I discovered that the following recipes still depends on adduser:
ppp-dialin, avahi, distcc, xserver-nodm-init, pulseaudio, hal, dbus

It would be good to use the useradd class with all of them.

-- 
Julian


