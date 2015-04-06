Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8BBA172A49
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 14:57:51 +0000 (UTC)
Received: by ierf6 with SMTP id f6so22797373ier.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 07:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=5hfSfgFlGMZjkVZelbvGrVEmhFOUgiiSDMuQI0QX20Y=;
	b=mMJFQbnfNVuViD+RvmtLC0kDUm/KqM/kxCzOyvXPvq5jOUEcc0ceX29thB/2goOMr2
	vJkJwvOdM+BsIDekcVme1TSkrCBCvEsZdWWITS8WsAzhd3mL8cfPvRCz+/lQNEuHp2Hf
	tfh5RATybvUCkZwpjHvI7u97DJXa61a8sku8XdVZ/IuBI/K5CLqIuXicikJk2hK+HZCP
	JRoS/UVgiIihhXs1zE3qSlpnz78oIgYurR2NY2kmBLEv/ClLUctM6Pi2CAJ1A9PzYONH
	/uaYLDZ7Tmtgbp1tvlxwNUf4ly0D9DxlFHcStx0GUA/fv8c640wIDTcsxyRvEwSLFskK
	5VcA==
MIME-Version: 1.0
X-Received: by 10.50.43.136 with SMTP id w8mr19257485igl.26.1428332272893;
	Mon, 06 Apr 2015 07:57:52 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Mon, 6 Apr 2015 07:57:52 -0700 (PDT)
In-Reply-To: <55229DD5.4050002@windriver.com>
References: <87d23uibxw.fsf@email.parenteses.org>
	<CAJTo0LYQXRL85iAGW82nATWdZXiCfhCFqQKKd0tC8DBBZvkJew@mail.gmail.com>
	<87wq1xgk2j.fsf@email.parenteses.org>
	<551AE604.6090804@windriver.com>
	<87oan8hpp6.fsf@email.parenteses.org>
	<551B08E6.8040906@windriver.com>
	<87k2xwhoei.fsf@email.parenteses.org>
	<551B0D16.8000608@windriver.com>
	<87d23ohngp.fsf@email.parenteses.org>
	<551B15F8.5090300@windriver.com>
	<87wq1pe7kc.fsf@email.parenteses.org>
	<55229DD5.4050002@windriver.com>
Date: Mon, 6 Apr 2015 11:57:52 -0300
X-Google-Sender-Auth: QQAdUbFO26I3Zrf3XXwNui018tg
Message-ID: <CAP9ODKpawyh5y0Y=w-FjL-tg0W+xyEXZXVFuKKjtPaMKi3mt0Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: Ownership issue in package contents
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
X-List-Received-Date: Mon, 06 Apr 2015 14:57:52 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 6, 2015 at 11:53 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 4/6/15 7:59 AM, Mario Domenech Goulart wrote:
>> Hi Mark and all,
>
> ...
>
>> Thanks for all the hints and for your patience.
>>
>> It looks like I was caught by a messed up TMPDIR.  After I removed
>> TMPDIR and baked the foo recipe, everything works.  I could make it work
>> by adding
>>
>>   FILESYSTEM_PERMS_TABLES = "files/fs-perms.txt ${THISDIR}/${PN}/fs-perms-foo.txt"
>>
>> to the foo.bb recipe.  In this case files/fs-perms.txt is the global
>> default one and ${THISDIR}/${PN}/fs-perms-foo.txt is the foo-specific
>> one that has one line only, which sets the permissions for
>> ${libexecdir}.
>>
>> I had to explicitly prepend files/fs-perms.txt because packages.bbclass
>> would not pick files/fs-perms.txt if FILESYSTEM_PERMS_TABLES is set.
>
> I've often thought that we probably should make FILESYSTEM_PERMS_TABLES into a
> globally defined configuration (bitbake.conf) and remove the default from the
> package.bbclass.  The design here was old, and based on even older code that was
> specific to device node generation.
>
> A patch to do this would likely be accepted.  (I'd make it so that an empty
> value would simply run through just the default internal values.)

I would think that OE-Core/files/fs-perms.txt should always be run as
first item and recipe or layer ones could be appended to it. So we can
avoid a lot of duplication and provide a more predictable behavior.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

