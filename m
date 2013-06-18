Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id BC07C6077F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 12:06:46 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id va7so4441401obc.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 05:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=N01CZFbV1iuQ39NqKrH+8KbYHJI8yCtm/prHn2nuoIs=;
	b=By+B+gP8sWwGBP3r6S1ady69NwY/3i7AVM3JcR3gb5rYRsnMxfYO3xoETCu7A2cCKG
	2dixK6EqBfEG0300GlIReeLPTh9YwE7WrWPhffeUoqpvljzrY4CLJnfl1JC2KqZlu0hq
	UUJOfdhIdWLs8462IEZ9VdHcVyPeo5BvsuhP4c/4TAfdXrBmgDTia820VcRE+bydhmk+
	aUOzpQh7Dnnd5hewqRdYeYKLbQUo3tm02PvxvH4mi0Qi2GBT5m8rACSDgWUmmRNcXjLv
	Rgxc1M/J8ZOIMB4WFvJCTETv4NYiQyKhdJcGl1E+5m90Nl2axFfx8pc5xjScReFb0gYo
	tbbw==
MIME-Version: 1.0
X-Received: by 10.60.144.202 with SMTP id so10mr7995011oeb.12.1371557207101;
	Tue, 18 Jun 2013 05:06:47 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Tue, 18 Jun 2013 05:06:47 -0700 (PDT)
In-Reply-To: <51BFB9D4.8080606@windriver.com>
References: <cover.1371447869.git.Qi.Chen@windriver.com>
	<4caf51c1d2225dc66aeef8326ba0616d97f7c691.1371447869.git.Qi.Chen@windriver.com>
	<CAP9ODKrhOpbGDXmU0Qhec5GJvzr1FFVv8TXdtT=AMJiOk-A2Rg@mail.gmail.com>
	<51BFB9D4.8080606@windriver.com>
Date: Tue, 18 Jun 2013 09:06:47 -0300
X-Google-Sender-Auth: go_VGL82cwnQCik1HzvrMhAQptM
Message-ID: <CAP9ODKqwPqzD0d4VkOmYuK2vvzxdxz4y3YJTQB6GZAAMuz-rsQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: qingtao.cao@windriver.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/9] busybox: remove the postinst part of the recipe
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
X-List-Received-Date: Tue, 18 Jun 2013 12:06:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 17, 2013 at 10:37 PM, ChenQi <Qi.Chen@windriver.com> wrote:
> On 06/18/2013 01:52 AM, Otavio Salvador wrote:
>>
>> On Mon, Jun 17, 2013 at 2:49 AM,  <Qi.Chen@windriver.com> wrote:
>>>
>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>
>>> Remove the pkg_postinst_${PN} from this recipe, as it's redundant.
>>> It basically wants to do the same thing as the update-alternatives
>>> does. But it doesn't do it well.
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>
>> Most of patch 1 and 2 should be merged; here you should drop the
>> postinst and convert these to the update-alternative way so we don't
>> have the tree broken after this patch and allow for bisect  to be
>> used.
>
> Hi Otavio,
>
> Maybe there's some misunderstanding here.
> To be clear, patch 1 and patch 2 do two different things.
> Patch 1 removes postinst, it has nothing to do with patch 2, which fix
> busybox.inc to support the FEATURE_INDIVIDUAL.
> And after this patch (patch 1), the tree is not broken. The busybox still
> works as it has been working so far.
>
> [
> And I just did a simple test to confirm this. On the lastest master, I
> removed the postinst part of busybox.inc, and built a core-image-minimal, it
> worked out well. Here's some output.
> root@qemuarm:~# ls -l /bin/ | grep busybox
> lrwxrwxrwx    1 root     root            12 Jun 18 01:31 ash -> /bin/busybox
> -rwsr-xr-x    1 root     root        556824 Jun 18 01:27 busybox
> lrwxrwxrwx    1 root     root            12 Jun 18 01:31 cat -> /bin/busybox
> lrwxrwxrwx    1 root     root            12 Jun 18 01:31 chattr ->
> /bin/busybox
> lrwxrwxrwx    1 root     root            12 Jun 18 01:31 chgrp ->
> /bin/busybox
> lrwxrwxrwx    1 root     root            12 Jun 18 01:31 chmod ->
> /bin/busybox
> lrwxrwxrwx    1 root     root            12 Jun 18 01:31 chown ->
> /bin/busybox
> lrwxrwxrwx    1 root     root            12 Jun 18 01:31 cp -> /bin/busybox
> ....
> ]

Oh I see.

So I have no objection for the patch :-)

Thanks by letting me know.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

