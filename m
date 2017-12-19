Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E7C5265CC6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 21:19:09 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b76so6263423wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 13:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gk+lPF9/C4Z6vvojOlEZqoFZMvN7r++a1fu1mnbY6wE=;
	b=EiXu4UqF585kLsv5vboECnP0x2S25EJT18dVP6DTuNmKrIBrJjirm8bl1h3lZFEBPc
	Z0FRwdqFXY8srl7H0KVBbAJQfiQ7MPHLljuouDRYNyxAJ055LFtz1m3nElw1rOW0qZhp
	RPkZrB1ZnHP6WwxTmpgrpavG28hPVgOVVOuZI50VVIODxQf+V/CMo7toys190stTadWH
	UQViBUvI9cELbrD0LYHC574YfWfhe7G8UB5nvxolBV3EW6n7dTdwrTBusd30vnWj+zhT
	h8XdKyzaLhAbZN3dV8V4oZpKMgOXgp9B60d8gPAMITL8fLiswO8MiB8rBo0Wu1poxe20
	EPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gk+lPF9/C4Z6vvojOlEZqoFZMvN7r++a1fu1mnbY6wE=;
	b=UqXLWD6HXYIT2C81fAMQg0mtegSmRRwPXHmE6yk7xdFFfsx0CLD15AB/fGRFqaHvJO
	O/jo1LXBPROvLYtfMbtmQ79+tIHSPNZvVyKWPW/Ql6QCg3GveqI6uXk5XYqrtK87YXX/
	nHZPOU1WSpgV5w0xiYxmXX+AGaKwlDKRKlG43DvkXoNnZ9Pt13uTGAfgMIA/Pz6C/Ibd
	+x4nHKLa9qNWOOjX0mpqbMlkW9dr7MZFKj8vA/mDbDI8j9iVmQi3GOYT12XplVm7ttWl
	cgFO+Is/iUriOUBPjfL2JQfiwxTupjEhS5syInxDN+hZyynHuKJ2C3V1b0OWtniUhGAb
	4jPw==
X-Gm-Message-State: AKGB3mJcZOE31zfSbgTLlLPWLNVyU8O5TNzFjvhXqkh+2CSFH58HjMdh
	/B2xtmClWIJu3XQwwe3+V/bGzrPLonTxblz+hZA=
X-Google-Smtp-Source: ACJfBovoRvufDOomhBahPMv9cCnNp26C1czK8qVypL6dP/Pzw/jF7UJUcWrjRYaVWbPSGntKwy3uLJ0Tr8N2jzkT/KE=
X-Received: by 10.28.101.11 with SMTP id z11mr4471478wmb.110.1513718350648;
	Tue, 19 Dec 2017 13:19:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.184.47 with HTTP; Tue, 19 Dec 2017 13:19:09 -0800 (PST)
In-Reply-To: <20171219205438.GN14220@bill-the-cat>
References: <20171219201148.19828-1-sgw@linux.intel.com>
	<20171219205438.GN14220@bill-the-cat>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 19 Dec 2017 13:19:09 -0800
Message-ID: <CAJ86T=Vkj_5FEWTheHJrH_N0nucHo9yW0MANMoevgUFwnswQ-w@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: preserve rootfs if mkext234fs() fails
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
X-List-Received-Date: Tue, 19 Dec 2017 21:19:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 19, 2017 at 12:54 PM, Tom Rini <trini@konsulko.com> wrote:
> On Tue, Dec 19, 2017 at 12:11:48PM -0800, Saul Wold wrote:
>> We have seen more failures, but have not been able to directly reproduce
>> it maybe svaing the rootfs and it contains some content that is tripping
>> up the e2fsprogs mkfs.ext4 populate_rootfs() function
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>  meta/classes/image_types.bbclass | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>> index 9188bed4197..6b4f39ed274 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -86,9 +86,14 @@ oe_mkext234fs () {
>>       bbdebug 1 Executing "dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024"
>>       dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024
>>       bbdebug 1 "Actual Rootfs size:  `du -s ${IMAGE_ROOTFS}`"
>> -     bbdebug 1 "Actual Partion size: `ls -s ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`"
>> +     bbdebug 1 "Actual Partion size: `ls -l ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`"
>>       bbdebug 1 Executing "mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}"
>>       mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}
>> +     if [ $? -ne 0 ]; then
>> +             tmp_saved_rootfs=`mktemp -d -p /tmp saved_rootfs.XXXXX`
>> +             cp -r ${IMAGE_ROOTFS} $tmp_saved_rootfs
>> +     fi
>
> Wouldn't it be better to just fail on error here, rather than dump stuff
> to /tmp ?

It already does fail with an error. Saving the state is temporary
additional debug to help understand why.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=12304

