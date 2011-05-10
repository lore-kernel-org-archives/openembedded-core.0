Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QJqnm-00074V-Rv
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 19:32:56 +0200
Received: by ewy5 with SMTP id 5so1918033ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 10:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Xn/0YkxWbXLL0zJFHJKS6UJLUXUJqewbi8N//ZA1D+c=;
	b=Z82Bj34NYfUeDn26bmbKHJqb3DBwTZSFvIgJ6OHAHr8ZPcWTYixLQtrc3e1RRqr6W2
	FK/wnvMLBM9iY7zUGdVJ4YGSYUSTycfYG02qrkJtd7z/20MYpECzncpqBsx9JoPCbPwf
	l0/MP53TiI0nN7xHH7d71nz469w3FofTiNe3o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=W2y1axzujFHfQYS7z4bMGuRAr2KVsqxIdIqDSm5KJSCOix5fIQuuzPF4vhc3S2pzrk
	5VEqZOdAwvoB3VdllMDm3IrTAvqgTzOsNBy6eHRuj26/6iItriUkQ551lHhNIm+Sy0ja
	mxyR7TNucJAkkcAPzIZaPlw8oeLgO9mzF3z/s=
Received: by 10.14.15.78 with SMTP id e54mr3904511eee.80.1305048608716; Tue,
	10 May 2011 10:30:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.5 with HTTP; Tue, 10 May 2011 10:29:38 -0700 (PDT)
In-Reply-To: <1305017649.30391.255.camel@rex>
References: <cover.1305004776.git.sgw@linux.intel.com>
	<491cfc546a2843493cf466c1e1af11ec8ac2dcee.1305004776.git.sgw@linux.intel.com>
	<1305017649.30391.255.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 May 2011 10:29:38 -0700
Message-ID: <BANLkTi=yx-0gCZ81mp0UZh+N52Ht5YYOqg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/30] conf/layer.conf: Use .= to append to BBPATH and =+ for BBFILES
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
X-List-Received-Date: Tue, 10 May 2011 17:32:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2011 at 1:54 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2011-05-09 at 22:26 -0700, Saul Wold wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> Appending to BBPATH gives a definite order to BBLAYERS which
>> means paths are preferred in order from left to right.
>>
>> [sgw: merged in comment]
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>> =C2=A0meta/conf/layer.conf | =C2=A0 10 +++++++++-
>> =C2=A01 files changed, 9 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
>> index 3f63c7d..10a6948 100644
>> --- a/meta/conf/layer.conf
>> +++ b/meta/conf/layer.conf
>> @@ -2,7 +2,15 @@ BBPATH ?=3D ""
>> =C2=A0# We have a conf and classes directory, add to BBPATH
>> =C2=A0BBPATH .=3D ":${LAYERDIR}"
>> =C2=A0# We have a packages directory, add to BBFILES
>> -BBFILES +=3D "${LAYERDIR}/packages/*/*.bb ${LAYERDIR}/recipes-*/*/*.bb"
>> +# packages is still there because metadata_scm.bbclass still uses
>> +# it to deduce the repo directory and thats the reason to prepend
>> +# to BBFILES here because this class uses the first entry in
>> +# BBFILES to calculate the scm base.
>> +# since the order of BBFLILES is not that important its acted upon
>> +# using BBFILES_PRIORITY we are ok to keep the oe-core BBFILES dir
>> +# at top
>
> Er, how about we actually fix metadata_scm.bbclass instead of making the
> world more complicated and fragile? :)
>
> I suspect metadata_scm could use the COREBASE variable and be much nicer
> code...
>
yes
OK let me see

> Cheers,
>
> Richard
>
>
>


