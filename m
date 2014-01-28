Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4DC6E87E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 01:53:02 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id h16so7734385oag.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 17:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=gCU1FjYQLJAOulaiSP9QMtNigyVFscnqREG3WZ4IRkU=;
	b=chJt32+lBEhn5pl9amv4GmvFcZE4co0WR6vk7uhEfwaeeeOUA6kuOSo9yEWRYk/HPv
	NCrI2agDU/oryynj8EdvbeaDsryFKTfAhH2W0VU9n6DPQchZUWcecUjL8RmEJNemJKCi
	8+oB7AsOIIlJCJMkh2XHmZ2SYi/H4ZfiyT/V28b04cVDGQa9igqWnm3k5xDiLfDWQLAO
	AG6pwLh1GXln94gj0wrnE6OIoWUDHBGXaWRbvZgMEF3SN2G5IXC8yXTyQ+MF+VAImmiD
	pSWYrRFTvXsD0BH+BrUFbNSMJuF9BYA6jm6JEm/mpGSHG3OBegr2VL4FgvLp6InJWB7d
	HUoQ==
MIME-Version: 1.0
X-Received: by 10.182.142.229 with SMTP id rz5mr26160126obb.12.1390873978870; 
	Mon, 27 Jan 2014 17:52:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 27 Jan 2014 17:52:58 -0800 (PST)
In-Reply-To: <52E6D52D.4070908@windriver.com>
References: <1390479065-24299-1-git-send-email-otavio@ossystems.com.br>
	<52E6D52D.4070908@windriver.com>
Date: Mon, 27 Jan 2014 23:52:58 -0200
X-Google-Sender-Auth: _B5qh1RiN9Ea5XF6-AGvPyd0N6c
Message-ID: <CAP9ODKoD9kif9pGiZyf-P2aKpbMFTUM8c2XUg7QUSZi5+BKnaA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Randy MacLeod <randy.macleod@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildhistory.bbclass: Improve robustness in image file listing
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
X-List-Received-Date: Tue, 28 Jan 2014 01:53:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 27, 2014 at 7:52 PM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> On 14-01-23 07:11 AM, Otavio Salvador wrote:
>>
>> The filenames sometimes may have strange names. With the 'awk' script
>> it handled a limited number of spaces in the filename and a package
>> installing a file named "test file with spaces" would have its name
>> truncated.
>>
>> This patch uses the find's printf formating to simplify the code and
>> proper handle this case. From a testing image, the only diff produced
>
> s/proper/properly/
>   Yes, I'm with the grammar police; we're here to be helpful.
>
>> is:
>>
>> ,----[ files-in-image.txt diff ]
>> | --rwxr-xr-x root       root                0 ./usr/bin/test\ file\ with\
>> | +-rwxr-xr-x root       root                0 ./usr/bin/test file with
>> spaces
>> `----
>>
>> The options used are available since findutils 4.2.5, released in 19
>> Nov 2004, making it available in all supported host distributions.
>
>
> Acked-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> Works for me, even on CentOS/RHEL-5.9/10 which does indeed have
> findutils > 4.2.5:
>
> $ rpm -qf `which find`
> findutils-4.2.27-6.el5
>
> and the find command seems to work as intended:
>
>  $ find jj -printf "%M %-10u %-10g %10s %p -> %l\n"  | cut -c 44-
>  jj ->
>  jj/usr ->
>  jj/usr/bin ->
>  jj/usr/bin/test file with spaces ->

Richard, do you want me to send a v2 or can you fix the typo when applying it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

