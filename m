Received: from mail-ob0-f170.google.com ([209.85.214.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U3nRR-0001Xa-OF
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 13:52:39 +0100
Received: by mail-ob0-f170.google.com with SMTP id wc20so3859273obb.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 04:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=+MOYrWsKYkCwMqu2SOdnfu6hxY7oCGMq+3ck6FL65yA=;
	b=qdwVAX2OILoazW356RkTBkj0EPWzIVQmAt07NdlEL3c5MaGdpGqQj+RJgaNZveoTv6
	pAeFOU0QHkbFPXXyMJ4zDC02Z9OEszavREVmICImiRYl+fQ5f1vWLyiazhbaWRIaQzuA
	P4S29JFgIcrdGvaHGWCvdWP00d2/FBU0CsIbPiq578UkVM3QxYKInIcCKtG75vhNTrLJ
	SCw+ASoFcy0gR2FM4yypJC5w0eX2IjGtURNzMmJ8pf5ZuDZtu7Ws1I7fpfRtrgwDbPQp
	fNTBpMFQJ59voyqNilYuO3BDBsaDTj6KxbXRaqy1qeLACcQbOKkjvPCkeILR7RL+hxSX
	AnAg==
MIME-Version: 1.0
X-Received: by 10.60.171.102 with SMTP id at6mr4056582oec.60.1360326999543;
	Fri, 08 Feb 2013 04:36:39 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Fri, 8 Feb 2013 04:36:39 -0800 (PST)
In-Reply-To: <5114EF31.6000304@r-finger.com>
References: <1360323133-28592-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LaOcn5Kr64Ga7zfuP5q1ixO8Ag4Uy+JrOmDe7AEhDDmpQ@mail.gmail.com>
	<CAP9ODKomOChKyoVD=-O9vNpnRFSyj+N+bz8C=mSLV3rky-hD2Q@mail.gmail.com>
	<CAJTo0LbOcirp-VJT1u9g9Xp8jTREb=UD+dJRftidVpt6tQ3HRg@mail.gmail.com>
	<5114E8E5.70203@r-finger.com>
	<CAP9ODKqRoNRNKqeZ6AyLd_ALjVu3Zo-7ZDtsmmvdj=m5CGwQWQ@mail.gmail.com>
	<5114EF31.6000304@r-finger.com>
Date: Fri, 8 Feb 2013 10:36:39 -0200
X-Google-Sender-Auth: oncIOnmcwFAHBZZ9t9HWLiCRR78
Message-ID: <CAP9ODKoYkBks7_o9U3SjUW6gEjV9u3A47NTGLEPUBQQvCqGTYQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzdata: We shouldn't override the localtime if it is valid
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
X-List-Received-Date: Fri, 08 Feb 2013 12:52:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 8, 2013 at 10:27 AM, Tomas Frydrych
<tf+lists.yocto@r-finger.com> wrote:
> On 08/02/13 12:07, Otavio Salvador wrote:
>> On Fri, Feb 8, 2013 at 10:00 AM, Tomas Frydrych
>> <tf+lists.yocto@r-finger.com> wrote:
>>> On 08/02/13 11:55, Burton, Ross wrote:
>>>> On 8 February 2013 11:38, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>>>>> Can you fix the code to symlink instead of copy?  systemd and more
>>>>>> needs a symlink so that it can identify the name of the timezone from
>>>>>> the link target.
>>>>>
>>>>> You mean inside the if?
>>>>
>>>> I mean in general /etc/localtime should be a symlink and not a copy.
>>>
>>> /etc/localtime is a real file so that /etc is not containing a link to a
>>> file in /usr; this has historically been the case unless I am not
>>> mistaken. systemd should grow up and read the contents :).
>>
>> In fact a lot of software expects it to be a symlink so it shouldn't be a copy.
>
> Lot of software does thing without understanding what it is doing,
> that's the nature of software. :) My point is that the code in the
> current recipe is not doing the unconditional copy by mistake, it is
> doing so intentionally so that local clock can work without /usr. Only
> systems that mandate the presence of /usr can use a symlink -- so this
> is not a bug fix but a change in an established system behaviour. If
> nothing else, the commit message should be clear in this regard.

I agree about the commit log. I'd for ignore the possibility to use
/etc without /usr as the applications running at very beggning will
start using GMT and move to timezone when /usr is ready. I see no
problem with that.

Ross, we are at same page? If yes I will send a v3 with improved commit log.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


