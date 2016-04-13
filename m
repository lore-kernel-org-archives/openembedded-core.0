Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1BC027317D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 17:30:07 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id a6so7290681vkh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 10:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=hAYytxnBQy1kpUTZzv2ZuA8zhlzSA643aGOMcr8QqLQ=;
	b=SL9Fb5cPalE9DIm9jIPaMuz2ieMxbksf/ZL2mcvyuQ5lfw6Z8Sw7R3Nd/XvIzLu5iM
	cbByDJpjPgFcH1BorShFI91hiuBNTlqYD71MvZs+KPCm241sT/0w2WoGEOHri4n5+591
	GROyKuBRM1HPRApOrqQBhrVTbdgcw33TDL/FPMKqStCYImnOfSkxBBslp33JZj3DkW3l
	CRt6h05M3oBBE2ZUWLkjqsxnmOkL4VZPgVqTJ/Srn2baQ8GqsNMbxrlHEtmCFex6h7/V
	c29LTqO2MJhv52SxQ3Zq7GxU4zpCbtxw5p0IXWIz7BcChGzrRGzaDRdzgR2JmwE7RoSZ
	nVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=hAYytxnBQy1kpUTZzv2ZuA8zhlzSA643aGOMcr8QqLQ=;
	b=TKuXT8uiyjL5MJECf/SqOWnBHUYGR0aP7VtR4q4vnmofqQWDaNO4CNQmZDhw8d2SP5
	//ZycPSXRMf83hKlauy/xPuHkOyHGSzKyJs0mfURZmJ24LrXS8dNfFTJwtoMJwSNtUKP
	Kx1ZR93sUcQwRdshZt13kwa7o5BCsOFaHXYVs5zGtyCjTz0O5ljUqvSEzM9/CNl6G/qS
	Mq9cQcmbMTUDtYncV8H/1MROEp2hDaScKtQ0ihbffQDTQkOC+TZ79iurOfgH09CYIvjo
	AnpiRLAm7XJnPOk4ty+YWEbmbDLBfe73Id7fYFog+NeXt+Ye9p60wWBXhdSUF+lLSrc9
	fGBw==
X-Gm-Message-State: AOPr4FU2bFRm7ce9PoUxTqMIiWEXO+ZJHLR2i0+zWikHfO/zSVZ8MaYS3nv8IDHOJdWu1HPEBwOh7c+ARxhhXg==
MIME-Version: 1.0
X-Received: by 10.159.36.240 with SMTP id 103mr5264443uar.98.1460568608258;
	Wed, 13 Apr 2016 10:30:08 -0700 (PDT)
Received: by 10.103.94.2 with HTTP; Wed, 13 Apr 2016 10:30:08 -0700 (PDT)
In-Reply-To: <20160412165115.GY16135@denix.org>
References: <1460474541-3625-1-git-send-email-william.c.randle@intel.com>
	<20160412165115.GY16135@denix.org>
Date: Wed, 13 Apr 2016 11:30:08 -0600
Message-ID: <CACS+7ZTTJOohmfe_iY3Y5Hc_FpLVh8Jvbpx9tdBAbifS4COWaQ@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: handle links in sorted order
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
X-List-Received-Date: Wed, 13 Apr 2016 17:30:09 -0000
Content-Type: text/plain; charset=UTF-8

On 12 April 2016 at 10:51, Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, Apr 12, 2016 at 08:22:21AM -0700, Bill Randle wrote:
>> When processing links, the directories are processed in unsorted order
>> which can result in cases like /var/lock -> /run/lock handled before
>> /var/run -> /run throwing an error for /var/run because /run already exists.
>> Change the link processing to ensure links are processed in sorted order of
>> the destination.
>
> Seems to resolve the issue for me.
>
>

For me it introduces a new issue. I use two perm files, the OE default
one, and one that changes two links to real directories. The new
packaging code complains that a link target exists as a directory,
even though a subsequent rule sets it up as a directory.

I think during parsing it should remove links as it finds directories
with the same path, and remove directories with the same path in the
order it sees them, that way when it does the in order processing it
uses the last definition in the permissions table.


>> [YOCTO #9430]
>>
>> Signed-off-by: Bill Randle <william.c.randle@intel.com>
>
> Reported-by: Denys Dmytriyenko <denys@ti.com>
> Tested-by: Denys Dmytriyenko <denys@ti.com>
>
>
>> ---
>>  meta/classes/package.bbclass | 19 ++++++++++---------
>>  1 file changed, 10 insertions(+), 9 deletions(-)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index 4452e2f..894b729 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -727,6 +727,7 @@ python fixup_perms () {
>>      dvar = d.getVar('PKGD', True)
>>
>>      fs_perms_table = {}
>> +    fs_link_table = {}
>>
>>      # By default all of the standard directories specified in
>>      # bitbake.conf will get 0755 root:root.
>> @@ -773,24 +774,27 @@ python fixup_perms () {
>>                      continue
>>                  entry = fs_perms_entry(d.expand(line))
>>                  if entry and entry.path:
>> -                    fs_perms_table[entry.path] = entry
>> +                    if entry.link:
>> +                        fs_link_table[entry.link] = entry
>> +                    else:
>> +                        fs_perms_table[entry.path] = entry
>>              f.close()
>>
>>      # Debug -- list out in-memory table
>>      #for dir in fs_perms_table:
>>      #    bb.note("Fixup Perms: %s: %s" % (dir, str(fs_perms_table[dir])))
>> +    #for link in fs_link_table:
>> +    #    bb.note("Fixup Perms: %s: %s" % (link, str(fs_link_table[link])))
>>
>>      # We process links first, so we can go back and fixup directory ownership
>>      # for any newly created directories
>> -    for dir in fs_perms_table:
>> -        if not fs_perms_table[dir].link:
>> -            continue
>> -
>> +    # Process in sorted order so /run gets created before /run/lock, etc.
>> +    for link in sorted(fs_link_table):
>> +        dir = fs_link_table[link].path
>>          origin = dvar + dir
>>          if not (cpath.exists(origin) and cpath.isdir(origin) and not cpath.islink(origin)):
>>              continue
>>
>> -        link = fs_perms_table[dir].link
>>          if link[0] == "/":
>>              target = dvar + link
>>              ptarget = link
>> @@ -810,9 +814,6 @@ python fixup_perms () {
>>          os.symlink(link, origin)
>>
>>      for dir in fs_perms_table:
>> -        if fs_perms_table[dir].link:
>> -            continue
>> -
>>          origin = dvar + dir
>>          if not (cpath.exists(origin) and cpath.isdir(origin)):
>>              continue
>> --
>> 2.5.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

