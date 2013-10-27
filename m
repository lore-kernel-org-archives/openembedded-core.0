Return-Path: <hans.beckerus@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 63ECE6CBAA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2013 08:17:16 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id q8so1916475lbi.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2013 01:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:mime-version:in-reply-to:content-type
	:content-transfer-encoding:message-id:cc:from:subject:date:to;
	bh=VmQA2xVTPZKr+QsnBcKfl1crGOHpLOeO9BhiHBzF39Q=;
	b=yDJDOJ38967kKCpiKX7xCdfVnpBGPtnXtlhv/lL+R3V04iH/Wacwb5PO4cooTWBojB
	K+mh09tOxmqQHFZAHVJcutVF9FxjVsD+3MmUajGHcaJgkpbHNDvL97QVBPzKSt4oZ0hc
	P0/vhiLGj8QMAJZcO0FlxaIg8IT5r4F9B9ifq786PKrGpc14wko9CFGSb8DddLiHzSSx
	Ol6vbBgPS1a411wrQNYfcg7UwAOnArtevYPxiXxAS1EjF+5FAn43/A1g2lVMb+7jb1oH
	2LWp75LFVKccaZF5/LaQWBD7/9I5ngFCFez/SQ+jvqJ+MxK2wLHLFeuew+QSnZoW1mq+
	AlQw==
X-Received: by 10.152.225.139 with SMTP id rk11mr10580357lac.27.1382861837294; 
	Sun, 27 Oct 2013 01:17:17 -0700 (PDT)
Received: from [192.168.0.103] (h135n8-rny-a12.ias.bredband.telia.com.
	[217.209.54.135])
	by mx.google.com with ESMTPSA id f4sm4534079lah.0.2013.10.27.01.17.15
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 27 Oct 2013 01:17:16 -0700 (PDT)
References: <1382827017-724-1-git-send-email-jacob.kroon@gmail.com>
	<526CBE56.8010406@gmail.com>
	<CAPbeDC=LTDOjrpP0XHXcAJVVtmVBZ9tiLm9iJ_MvXFypa0uWMg@mail.gmail.com>
	<526CC5FF.7030404@gmail.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <526CC5FF.7030404@gmail.com>
Message-Id: <F361C780-D09F-4544-BD43-B67DAE6FF248@gmail.com>
X-Mailer: iPhone Mail (11A501)
From: =?utf-8?Q?Hans_Beck=C3=A9rus?= <hans.beckerus@gmail.com>
Date: Sun, 27 Oct 2013 09:17:14 +0100
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] update-rc.d.bbclass: Fix host/target test in postinst
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
X-List-Received-Date: Sun, 27 Oct 2013 08:17:17 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable




> 27 okt 2013 kl. 08:51 skrev Hans Beckerus <hans.beckerus@gmail.com>:
>=20
>> On 2013-10-27 8:25, Jacob Kroon wrote:
>> Hi Hans,
>> I'm far from being a scripting-expert, so I just did what I could in orde=
r to=20
>> get rid of the warning and stop the service.
>> Sending this patch was just a way to raise some attention to the bug and g=
et=20
>> some discussion going :-)
> No problem ;)
> Try this instead
>=20
> if [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
>                echo stop
> fi
>=20
...and of course replace the 'echo stop' with the previous real call to the i=
nit script. This was only to test the syntax.

> Thanks.
> Hans
>=20
>> If there are other ways one should proceed instead of sending "broken" pa=
tches=20
>> to the mailing list I will do so in the future.
>> Regards
>> Jacob
>>=20
>>=20
>> On Sun, Oct 27, 2013 at 8:18 AM, Hans Beckerus <hans.beckerus@gmail.com=20=

>> <mailto:hans.beckerus@gmail.com>> wrote:
>>=20
>>>    On 2013-10-27 12:36, Jacob Kroon wrote:
>>> When running the postinst script I get a shell warning:
>>>=20
>>> sh: argument expected
>>>=20
>>> and the service is never stopped. This patch fixes the warning
>>> message and stops the service.
>>    This patch does not look right to me?
>>    If length of $(D) is zero the condition will *always* be true. Instead=
 of
>>    actually testing the existence of "${INIT_D_DIR}/${INITSCRIPT_NAME}" i=
t is
>>    now simply converted to a string. What did I miss ;)
>>=20
>>    Thanks.
>>    Hans
>>=20
>>> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com
>>    <mailto:jacob.kroon@gmail.com>>
>>> ---
>>> meta/classes/update-rc.d.bbclass | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/meta/classes/update-rc.d.bbclass
>>    b/meta/classes/update-rc.d.bbclass
>>> index e14659d..835b717 100644
>>> --- a/meta/classes/update-rc.d.bbclass
>>> +++ b/meta/classes/update-rc.d.bbclass
>>> @@ -16,7 +16,7 @@ updatercd_postinst() {
>>> # test if there is a previous init script there, ie, we are updating the=

>>    package
>>> # if so, we stop the service and remove it before we install from the
>>    new package
>>> if type update-rc.d >/dev/null 2>/dev/null; then
>>> -     if [ -z "$D" -a `test -f "${INIT_D_DIR}/${INITSCRIPT_NAME}"` ]; th=
en
>>> +     if [ -z "$D" -a "test -f ${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then=

>>>              ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
>>>      fi
>>>      if [ -n "$D" ]; then
>>=20
>>    _______________________________________________
>>    Openembedded-core mailing list
>>    Openembedded-core@lists.openembedded.org
>>    <mailto:Openembedded-core@lists.openembedded.org>
>>    http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20
>>=20
>>=20
>>=20
>> --=20
>>   -- Jacob
>=20

