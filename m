Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SUhAs-0007TO-5M
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 18:34:06 +0200
Received: by werg55 with SMTP id g55so648168wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 09:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=l1bOKj+5g+itIjgiEcnfbiKVW0ZmPw2WO+PbqTsgq0g=;
	b=VJCeEMdq7blRYrmKESHcD8NRA29r4CJdFss2tIc/HqAzdDjWE94Zy8hciqU9ZTr8Zf
	g9H87bHO39/BktbOmwlw+SQQEQPoXlluSfufxsemFbcTkqcsWMk9oD5TN15eSc4qDwtt
	/k4Z+y82yTw0X/E6AAkw+6Ypi6w98Y15JcBFgn7FJgAYuCyIN8g0nkuuNkvbUuUDGVW8
	eym0Xz7czkt5yV1xfar4ioqQJnHxoCmsq5LugOQdf60kM08zBJtloBHyRm2e0ncI20sn
	QoeHF6QRwJyruTVs1BdR6bgssq2jks4T9CcMyrd9sdarfz92vfOp/wj/nhPu+VYncdPW
	cctg==
Received: by 10.180.24.39 with SMTP id r7mr42054764wif.9.1337185444815; Wed,
	16 May 2012 09:24:04 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.181.16 with HTTP; Wed, 16 May 2012 09:23:44 -0700 (PDT)
In-Reply-To: <4FB3C2CC.7010204@windriver.com>
References: <20120515140110.2ba5a1be@wrlaptop>
	<CAKSdS8K64oTpq4asBcL9k4BgCe6BOEAwX3exQyq4GoTHtAxW9w@mail.gmail.com>
	<4FB32EA1.3060601@linux.intel.com> <4FB3C2CC.7010204@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 16 May 2012 09:23:44 -0700
X-Google-Sender-Auth: iTD7VfdC_pV1XaYWw_EQ3X_nNH0
Message-ID: <CABcZANkfSKqLJZJi6mp4V1aOFLCWEaLF5Bod=9SKjZh2s9bZAA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: FOO_subtract, the logical antidote to FOO_append.
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
X-List-Received-Date: Wed, 16 May 2012 16:34:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2012 at 8:07 AM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 5/15/12 11:35 PM, Saul Wold wrote:
>>
>> On 05/15/2012 11:46 PM, Manuel Bessler wrote:
>>>
>>> Just a few minutes ago I was wondering if such a feature did exist...
>>>
>>> I ran into a situation where I wanted to remove something from a
>>> .bbappend
>>> that is added to a variable using VARIABLE_append =3D "this and that"
>>>
>> My understanding is that a _subtract is fraught with danger, there all
>> sorts of ordering implications.
>>
>> For what you are trying to do in a .bbappend, can be done by using
>> oe_filter_out() from utils.bbclass, it has to be done in anonymous code.
>>
>> VARIABLE :=3D "${@oe_filter_out('xxx', '${VARIABLE}', d)}"
>>
>> This might be what you want.
>
>
> There are two issues I believe Peter is having.. the first is trying to
> figure out how to filter stuff out of _append. =C2=A0I'm sure sure the ab=
ove will
> be able to do that.
>
> But the real problem we keep struggling with is .conf load order.. you tr=
y
> to set some nice value in local.conf, and some later configuration file a=
dds
> to it, or simply overwrites it. =C2=A0He'd like a way to strip out things=
 like
> that.
>
> I suspect the real answer though is fix the various configuration setting=
s
> to better allow them to be overridden, but I'm not sure exactly how.

One related thing that won't solve this, but is worth noting -- I
think ??=3D is a much more sane choice than ?=3D in almost all cases. We
should think about a janitorial task to switch to ??=3D after carefully
considering potential implications for each.
--=20
Christopher Larson


