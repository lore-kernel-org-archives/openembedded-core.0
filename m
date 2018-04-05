Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0B78D74DF4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 00:54:54 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x82so2026041wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2018 17:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KHYkSUGDnJ7IN9Qk1ZvJccOVprDtolq3AO2JyZLUCLc=;
	b=YI86ihRq33OlHWb40OZMZQwbMLhuD5HBsYqLFSXUUcLZUXrnrZl3+fbf7yZ6GQVq8p
	gytJkZLH+RXV9BOJSOUOfWQMYQlPHHERmpZSvKtiV1PIk2wnlPbPXl7xxxg2juw8+1BD
	ggEKdwxoCL7MBiLYM8+64ZseRxn8KWTm6UHkQcALZJAaDQAjN250A6nNBep1GUG9BfTs
	CJ/Qk9Wje0SU3nO/ot9GY4ibdHQ8PlMcVirMUsGr80/4fNCiOWH0ajYFReRdBoBQ1W4D
	OiQThbrFE0IrZOV3ay3Uigy2CtRFj7+POpZ1nLMW/jQpJf/O1zwxXrafZ1U4TIypK0GZ
	l1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KHYkSUGDnJ7IN9Qk1ZvJccOVprDtolq3AO2JyZLUCLc=;
	b=nbayI4VByT8mybIq+h1kVa6T1Vc5bSbi0npGcmoRnMoHgYNlbI/aL8wy3qjJXPnY+Y
	ph22UZ17MzFQJ5mc/YJ1JMcDHegBY2XDx1UlBJcrBuXph3r94oDfpOKr98kdhTeJWqEP
	vuRXZzeddcRvgqyxyYJEQ8Wr0NR54+jVLNKy26xipyIkE8zjldUOWtMHIGMCvLNNcWyq
	L4FjvbWDfZcHX6EVl8bb+yPQxFTncoxXZ1aPRxh0BhfqwibAwAHZeqTpCZMYFrcXNjlk
	Rz9cmhNIWRb6tVaL943mQB+SW5xP3WHDmU/XwasEKowXRJPBLBCU8YzvZchK/Mge7BWY
	JZsw==
X-Gm-Message-State: AElRT7FShfvv9sfMG71ETG7rpGUYOpyvDvj8rEbY+3PWAK1VGlNBm42d
	KjGsqrS0tZHC/sUkWhtG572kOBMKoHC0wxYrM7M=
X-Google-Smtp-Source: AIpwx49me3DmtNXR3NKBHhBVevgEZyCkP/F5RKIhFouUmtGmP745PLPBX9OK38mSgpFRWBy3d1kbtQhMpH0LBrgt3H8=
X-Received: by 10.28.212.84 with SMTP id l81mr8707943wmg.151.1522889695272;
	Wed, 04 Apr 2018 17:54:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Wed, 4 Apr 2018 17:54:54 -0700 (PDT)
In-Reply-To: <CAJ86T=V=+cLpzMFoWS42NMDAuOrUMzsLCmUHfUhTrP8aEvcR2Q@mail.gmail.com>
References: <1519779977-9136-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=V=+cLpzMFoWS42NMDAuOrUMzsLCmUHfUhTrP8aEvcR2Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 4 Apr 2018 17:54:54 -0700
Message-ID: <CAJ86T=W_-BptfjFibUTj+Kd7jCaSmq_X4=uwa=+Xz0ZbrXWvaQ@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [morty][PATCH] buildhistory: fix latest_srcrev in the common case
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
X-List-Received-Date: Thu, 05 Apr 2018 00:54:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 14, 2018 at 4:52 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, Feb 27, 2018 at 5:06 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> From: Christopher Larson <chris_larson@mentor.com>
>>
>> buildhistory was writing srcrevs.values() as SRCREV when only one
>> srcrev/branch exists. This returns a view of the dictionary values in python
>> 3, and used to return a list in python 2, neither of which is an appropriate
>> value for SRCREV. It was resulting in latest_srcrev files like this:
>>
>>     # SRCREV = "346584bf6e38232be8773c24fd7dedcbd7b3d9ed"
>>     SRCREV = "dict_values(['346584bf6e38232be8773c24fd7dedcbd7b3d9ed'])"
>>
>> Which in turn would result in invalid output in buildhistory-collect-srcrevs.
>> Fix by calling `next(iter())` on the `.values()`
>
> Ping.

Ping again.

This should be a very low risk backport fix for morty but if there are
any concerns then please let me know.

>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> (cherry picked from commit ef826a395612400924bbe49859d256b237ff59e1)
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/classes/buildhistory.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
>> index 3a5bc2c..d82e9bb 100644
>> --- a/meta/classes/buildhistory.bbclass
>> +++ b/meta/classes/buildhistory.bbclass
>> @@ -833,7 +833,7 @@ python write_srcrev() {
>>                          f.write('# SRCREV_%s = "%s"\n' % (name, orig_srcrev))
>>                      f.write('SRCREV_%s = "%s"\n' % (name, srcrev))
>>              else:
>> -                f.write('SRCREV = "%s"\n' % srcrevs.values())
>> +                f.write('SRCREV = "%s"\n' % next(iter(srcrevs.values())))
>>              if len(tag_srcrevs) > 0:
>>                  for name, srcrev in tag_srcrevs.items():
>>                      f.write('# tag_%s = "%s"\n' % (name, srcrev))
>> --
>> 1.9.1
>>

