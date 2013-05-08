Received: from mail-oa0-f46.google.com ([209.85.219.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <erik.boto@pelagicore.com>) id 1UZyGW-0008Ec-8E
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 08:54:27 +0200
Received: by mail-oa0-f46.google.com with SMTP id h2so1652714oag.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 23:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=y48dacfcS5raMGgmyVWfY3l/ZhnEnL+OV38StOWn4S4=;
	b=F4Zu/nJTFQBPGMhMZoTfoNrpYtnWMt5QG4NTACYSI6lGlVa3qSOVq6CQUZnLJeK+wl
	p3UmLYumFJwhgYGncS//cP/yvBBXOMuL5Of/WqXQ8zlKuSEUzpWl/ncehanPjRk6rre0
	zc+qGHOHgjDEtpruBcSrzgxBXvmyBNBbLXsBBcXgfRN02HuNVFned+l6g8vNv9ZXuLOM
	E/qlg3C6xr1xsYPouzySkkzR1kE8xXLhJhK2MuqGq1L/cYPGyZFjrveQgESrYeKsnT0T
	NECFv+eeeyfj5JSo4O++ax4uiwlCHsxVUBtiupyIChxVTcRMMgWTVM1Qh8cLX+wSWw1l
	hmng==
MIME-Version: 1.0
X-Received: by 10.182.92.133 with SMTP id cm5mr1617827obb.73.1367994973806;
	Tue, 07 May 2013 23:36:13 -0700 (PDT)
Received: by 10.76.141.6 with HTTP; Tue, 7 May 2013 23:36:13 -0700 (PDT)
In-Reply-To: <5189EC92.1020909@windriver.com>
References: <CA+AhUGxD7Taf2RhuoAp7FF=wfWWJnPSi7_o6fSZZiNMq-u0vgA@mail.gmail.com>
	<5189EC92.1020909@windriver.com>
Date: Wed, 8 May 2013 08:36:13 +0200
Message-ID: <CA+AhUGyN_LX66XE61rtdxS81eCsAy7Ku-F1UwRWuBFrc4=GXAQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Gm-Message-State: ALoCoQk8zsQN3p29DlpC7yg6oRWrIvC65cJ7z6LNGV1wWiSllBWdtsYTwYU8qidXwHb3+wz+s8Cx
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] bbclass for automatic generation of binary recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2013 06:54:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 8, 2013 at 8:11 AM, Robert Yang <liezhi.yang@windriver.com> wro=
te:
>
> Is it similar to meta/classes/package.bbclass ?
>
> // Robert

I would say it's in addition to package.bbclass.

The idea is that the developers of the closed source software uses OE
to build their software from source, and in this build process the
files needed for a binary distribution in OE is automatically
generated. These generated files can be distributed to others that
wish to use that closed source software in OE. So it would use some of
the output from package.bbclass, like the package split, but then
generate some extra files.

Cheers,
Erik


>
>
> On 05/08/2013 01:53 PM, Erik Bot=F6 wrote:
>>
>> Hi,
>>
>> Background:
>> If you use OE to build software which includes e.g. a closed source
>> library, but still want to others to be able to build software based
>> on that library in a OE environment you would have to create recipes
>> that contains a binary version of your library + headers manually.
>> This would have to be done manually for each package, and as the
>> development of the library continues the binary recipes will have to
>> be manually updated to keep in sync.
>>
>> Idea:
>> Create a new bbclass that handles this automatically as much as
>> possible. The basic idea is to:
>> - Create a tarball of ${WORKDIR}/image/ alternatively
>>    ${WORKDIR}/packages-split/
>> - By parsing the "source recipe", create a "binary recipe" that uses
>> that tarball
>>
>> The binary recipe should work as a drop in replacement of the source
>> recipe. This means that the other recipes depending on the closed
>> source software shouldn't need to be adapted to work with one or the
>> other.
>>
>> I'd like feedback on whether you think the idea is feasible, and if
>> you think it could be useful for others. And anything else you think
>> of.
>>
>> Cheers,
>> Erik Bot=F6
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>


