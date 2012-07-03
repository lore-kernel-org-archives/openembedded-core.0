Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Sm9Eq-0005SC-EU
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 21:58:20 +0200
Received: by lbol5 with SMTP id l5so9034937lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2012 12:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=42xXizHMk2tbnBuv3i9scoiTwtQ/PzZeOFSPwP8unpE=;
	b=mGf0mtqxtdq3MPeOVzwA4yXkYYK5H4ghpTOMQpeNZARgpgU6TW4AfKmW2+xKtNkR6B
	xjyPRSvSOwycf7vVMbFt8sNnXQa5oD6qNbqFn0k1xpA54GcbYAryrSXSxHUra1WpI/Zc
	qANb649Z/gGfIjKw1iMy15DSJdnWeksVt6Fb/YCrmKCYQt2+p1TdYX5BkO50wLvQmbaf
	eiU40NwavhKzu2UB/ZKa0avcQ+H+d0MIMRO62yVvlpz6fHi0wyt+UXPc9CH1NTuoquSP
	WdyhNkZLv2GnDuzcLMGZ5zH+0pJNrpy4Mc6YLBPd36zVZ1KFfY9BNWEQZAP4KBebQzid
	E+Kw==
Received: by 10.112.85.225 with SMTP id k1mr8743151lbz.38.1341344838105; Tue,
	03 Jul 2012 12:47:18 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Tue, 3 Jul 2012 12:46:57 -0700 (PDT)
In-Reply-To: <25E47B94-1ECC-40D1-B0B4-15793B6F8B7D@gmail.com>
References: <1341276037-32076-1-git-send-email-sgw@linux.intel.com>
	<CABcZANnVy0B_wFyVhxz_JsipTf_PXL2ZzLU4hnNGbObDbZRDLw@mail.gmail.com>
	<4FF3280B.3020008@linux.intel.com>
	<25E47B94-1ECC-40D1-B0B4-15793B6F8B7D@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 3 Jul 2012 12:46:57 -0700
X-Google-Sender-Auth: huOH60EU9wI5QHDsH88QhshGWnQ
Message-ID: <CABcZAN=wQfUSiX423hL7W1ok8W25qqzLvBCyDFJmn1rhFPjhVg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC v2] package.bbclass: enable the use of package_qa_handle_error
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
X-List-Received-Date: Tue, 03 Jul 2012 19:58:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 3, 2012 at 12:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>
> -Khem
>
> On Jul 3, 2012, at 10:12 AM, Saul Wold <sgw@linux.intel.com> wrote:
>
>> On 07/03/2012 06:55 AM, Chris Larson wrote:
>>> On Mon, Jul 2, 2012 at 5:40 PM, Saul Wold<sgw@linux.intel.com>  wrote:
>>>> This will allow the reporting of these errors as either WARNINGs (defa=
ult)
>>>> or ERRORs if installed_vs_shipped is added to the ERROR_QA of the poli=
cy
>>>> file (such as a<distro_name>.conf file.
>>>>
>>>> V2: found the code I had intended to send instead of that other junk,
>>>>     was just not watching what I pushed on that one, sorry. (this is e=
dit in
>>>>     no in the actual commit message)
>>>>
>>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>>> ---
>>>>  meta/classes/package.bbclass |   11 ++++++++---
>>>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbcla=
ss
>>>> index 0b98c6b..ff2ec96 100644
>>>> --- a/meta/classes/package.bbclass
>>>> +++ b/meta/classes/package.bbclass
>>>> @@ -988,9 +988,14 @@ python populate_packages () {
>>>>                                 unshipped.append(path)
>>>>
>>>>         if unshipped !=3D []:
>>>> -               bb.warn("For recipe %s, the following files/directorie=
s were installed but not shipped in any package:" % pn)
>>>> -               for f in unshipped:
>>>> -                       bb.warn("  " + f)
>>>> +               msg =3D pn + ": Files/directories were installed but n=
ot shipped"
>>>> +               skip =3D (d.getVar('INSANE_SKIP_' + pn, True) or "").s=
plit()
>>>> +               if "installed_vs_shipped" in skip:
>>>> +                       bb.note("Package %s skipping QA tests: install=
ed_vs_shipped" % pn)
>>>> +               else:
>>>> +                       package_qa_handle_error("installed_vs_shipped"=
, msg, d)
>>>> +                       for f in unshipped:
>>>> +                               package_qa_handle_error("installed_vs_=
shipped", "  " + f, d)
>>>
>>> Hmm, I wonder if this is best, or if it should assemble a single
>>> message with newlines separating the files. *thinks*
>>
>> So that would cause only 1 ERROR or WARNING count, vs N ERRORs or WARNIG=
S in the final count for every file that is listed, I think it's good to ha=
ve the larger count it signal's something went wrong if that count increase=
s greatly when a recipe is changed.
>
> If its flagged as error then count really doesn't matter and if it is war=
ning then user doesnt care
> But reporting all together may be better
>
>>
>> Could work either way, but I like the exaggerated count.

This is true, but conceptually it's a single message. Further, those
messages are tightly bound to the previous message in the multiple
message case, which means there's a particular context involved which
isn't reflected in the messages. They can and will be intertwined with
other messages from other tasks. That isn't the case if it's just one.
--=20
Christopher Larson


