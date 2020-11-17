Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.9881.1605627668141968406
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nl3cpDbr;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id z3so12268992qtw.9
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 07:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5RdoeAv5IoEGCNmaU7lRKSZ+wFf5UiZV38vZhNEpCS4=;
        b=Nl3cpDbrFoLJFnQg/w5P7GVcAfqqv2ftmf79XCUr4MO0OxWHK47LZBDMsSwBBgyd/9
         aqs5G4CiNwrpoPlbzAKE/VkYs2CZYPaiah0jnDyI2opUm6YdVWQ4EVHquyyhfMOj17Dq
         YcvaQxrrL6kUIdIRtdgZBMdEg0wQCB7Co7YcoecSlVQNFK+gXUDPkcN+nW/u88pRzNL5
         byeZr/UwV8+LqNFOGXp7oYFK8HfJGg9KGDAwH0vnlmZDOVXWY03j/KPPkbJMH1FGPwXa
         eBXAdczX93a6IPjrwyCw03i82Mc1/i29EsZePtAGv0EbOaSoKdaUfWWCuxeWLazAxpeO
         TEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5RdoeAv5IoEGCNmaU7lRKSZ+wFf5UiZV38vZhNEpCS4=;
        b=RvOrVG9X7zAWgV9f5HtBAbqp1l83MVwMznPaI8uF9R7StrrbSK4LWPHf9aTqJztA+L
         AEfJl7vvXAbJqL47DPFLmBb+iRRA7kZA4+4chtiuujktNIuYREtVYltXp19V9jYo4KD1
         fXij6ZwjJaMB9BaD+eMB6f2vclS1slzlrepbW+llHggjP0quVvG2CHCAhuHZxWt03xKK
         w1Dwb0G7lAOre0jdklMePrYKO0gsO9RLAsj0PRDoDkR57sOMm89CiutSN/SnqU7O68JB
         hcRwV8lqQnog/W629EwBvXCakvrkYMzP/WNwSsSl21/RLx+2Ry3/4kOf8rJGZf3ADcJ4
         +BSA==
X-Gm-Message-State: AOAM532GXgQDaE5S1XP0Wrq4wT6L1B66w1hHwVtdBNS9I5SQxpG0guZd
	hEddtWGrz9J9nwWOvGGO7s7v9+uIiBYc/LW7wGY=
X-Google-Smtp-Source: ABdhPJzw3ASV7595zWbTBeDvZxd5cP7zfMdtaEE+83jmIPuDKmb680z75AE8HRdY2zuyIigPY5eriPwZGxllvAyw7g8=
X-Received: by 2002:ac8:5844:: with SMTP id h4mr249566qth.194.1605627667136;
 Tue, 17 Nov 2020 07:41:07 -0800 (PST)
MIME-Version: 1.0
References: <20201117065508.1575532-1-raj.khem@gmail.com> <CANNYZj-mVEE0vD8tpJQTPvA_+0Ny7JNk0co97xU5gs+U=PbUOg@mail.gmail.com>
 <CA+chaQcyh_i92pMt32-iiehDsxr1TyhF5pNKiRQstwPz7UVArQ@mail.gmail.com> <CANNYZj-SwsznTXvooSHeVijaUPVPgBBN_gFfKednZCe-OGcdow@mail.gmail.com>
In-Reply-To: <CANNYZj-SwsznTXvooSHeVijaUPVPgBBN_gFfKednZCe-OGcdow@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 17 Nov 2020 07:40:41 -0800
Message-ID: <CAMKF1sqzEw8sAhzsUvPz6rB1OR=i8Cg7-2WUtpjW8tmS3HGF_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] distutils3-base.bbclass: Inherit python3targetconfig only for target recipes
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2020 at 1:19 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Yes - and if python3-scons-native is the only such recipe we can find, I think it's better to merge the recipe with the target one.
>
python3-scons-native is just a manifestation of a larger problem which
is a regression and this suggestion compounds the problem by setting
an unequal rule where non-python packages can
have a native-recipe and recipe but python ones can not, therefore we
need to fix this properly in core classes instead.

> Alex
>
> On Tue, 17 Nov 2020 at 10:12, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> You mean that in BBCLASSEXTEND'ed recipes mentioned in the explanation it should work and only the recipes which directly inherit native, like
>> meta/recipes-devtools/python/python3-scons-native_3.1.2.bb
>> are broken?
>>
>> On Tue, Nov 17, 2020 at 9:53 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>>
>>> This explanation does not seem right. The class only sets
>>>
>>> inherit python3native
>>> DEPENDS_append = " python3"
>>>
>>> which should not drag in target python when it is inherited from -native recipes, only python3-native.
>>>
>>> Alex
>>>
>>> On Tue, 17 Nov 2020 at 07:55, Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>> python3targetconfig append target python3 to dependencies
>>>> unconditionally, and here its inherited unconditionally too but
>>>> distutils3-base is inherited in BBCLASSEXTEND'ed recipes and other not-target
>>>> recipes as well. Hence the change added via 9c8f666097802cb594a759989edcf01603a22df3
>>>> is now bridging the native dependencies with target python3 and thats
>>>> resulting all sorts of rebuilds for multimachine builds e.g.
>>>>
>>>> MACHINE=qemuarm bitbake python3-scons-native
>>>> MACHINE=qemumips bitbake python3-scons-native
>>>>
>>>> results in rebuilds for python3-scons-native
>>>>
>>>> bitbake-diffsigs shows
>>>>
>>>> Hash for dependent task python/python3-scons-native_3.1.2.bb:do_populate_sysroot changed from 1cdb93193b416477df6faa137e83a967b433c7aa29033146b405153f73f36933 to 3cea1e7cbedd121ecb768fbc291cc4e4d7d3b5c0442897
>>>> 0e3b97bd058d162065
>>>>     Hash for dependent task python/python3-scons-native_3.1.2.bb:do_install changed from 8d6018fd03ffc6060a04532dc39a5b7ccca1be026a69d069cb4fb11aef86dd89 to c5f1d173596a8e910f45a2b6e0b4dab96cd0102be4d62bd3156
>>>> 229cb0f5ebb11
>>>>         Hash for dependent task python/python3-scons-native_3.1.2.bb:do_compile changed from e3ee4b52a15267e6ae7853ec19a666b2fb62608a597608793336382d1c45f8a0 to 1e582043dfe6b3e00aaa532f363ce6afb37652abe837dac
>>>> 7cc9769194c43eae1
>>>>             Hash for dependent task python/python3-scons-native_3.1.2.bb:do_configure changed from 770a4d5a77a96ebd9e1e7368f710bca3f88e3b1266dffa3b2d0360b1e3a81e27 to a366982778b03eee5165c3117ee778f848acdfaa2
>>>> b346650fbdf114ac70ab57b
>>>>                 Hash for dependent task python/python3-scons-native_3.1.2.bb:do_prepare_recipe_sysroot changed from 958910037856ff5d5eb2b5162b3cdd02a3a710fc543b933cfeba771ee095cb72 to 474333fb565f908992fd3716
>>>> 4935aaecf31a79e867826fe634cde4f44171d8e7
>>>>                     Hash for dependent task python/python3_3.9.0.bb:do_populate_sysroot changed from 7ac1c4fcbb2eacf98d2c32d991751bd2f3c7d55e2e32f2c9e485e7f5975fecf8 to 25dcfe74a95af19cce8df7c29311cc5edbbf6ad
>>>> 08777e46a6fa6e417c0445018
>>>>
>>>> ...
>>>>
>>>> Therefore limit inheriting this class only for target recipes.
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
>>>> ---
>>>>  meta/classes/distutils3-base.bbclass | 3 +--
>>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutils3-base.bbclass
>>>> index a277d1c7bc..882db9f605 100644
>>>> --- a/meta/classes/distutils3-base.bbclass
>>>> +++ b/meta/classes/distutils3-base.bbclass
>>>> @@ -1,5 +1,4 @@
>>>>  DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES') == '')]}"
>>>>  RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
>>>>
>>>> -inherit distutils-common-base python3native python3targetconfig
>>>> -
>>>> +inherit distutils-common-base python3native ${@['python3targetconfig', '']['${CLASSOVERRIDE}' == 'class-target']}
>>>> --
>>>> 2.29.2
>>>>
>>>
>>> 
>>>
