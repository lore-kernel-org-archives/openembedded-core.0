Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkION-0001lj-RM
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 19:20:31 +0200
Received: by eaal1 with SMTP id l1so933043eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 10:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=y+ngd9OnLDNHjYH8eN3Rawp2skTCbMnE5GEFSnUEN5U=;
	b=D3o0Ivs/O91yBq1ePLkSFF3Bk/12icMqbTPNVEI9JDYE1aS9IRJ5TPz/3/RmCKjU0P
	c6xs0vcY0MQKRUt4dapApMdKQueIxRsxu/BPEb7xiljWJOGI9vSeF23co2cxOZ2SfzVf
	5xV0mQLxs4bo7utR9YEKDOxplgIg5BzsIym8z7MYW6NbZYnPJrVQ+m69nqVBXB+IQ4wc
	ILeAge0JrWj45XhVAhzMHNxhWvrt8gghFctTt2CVtU0Be3JBdxpittBYx8t0BC+hyBaX
	z/de63b5liUBlf0rK6UuR4iJLvcPyvoIZMx1exwxNsw1iVCF7aOfrKuD01ikX8bO1lXv
	zMyw==
MIME-Version: 1.0
Received: by 10.14.37.76 with SMTP id x52mr700263eea.102.1340903376868; Thu,
	28 Jun 2012 10:09:36 -0700 (PDT)
Received: by 10.14.210.199 with HTTP; Thu, 28 Jun 2012 10:09:36 -0700 (PDT)
In-Reply-To: <1340800639.23146.38.camel@ted>
References: <55a411d66293b6d2196e98376f0fb9e4487b4bdf.1340777116.git.raj.khem@gmail.com>
	<3ef3573dcf3deb300a12a1830ccc768c999e61fe.1340777116.git.raj.khem@gmail.com>
	<1340800639.23146.38.camel@ted>
Date: Thu, 28 Jun 2012 10:09:36 -0700
Message-ID: <CAMKF1soF2MJDnVQVqcY6eQLK0nVyDK1BKX7Htkx-M8d3jV9MPQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] tclibc-eglibc.inc: Define USE_NLS
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
X-List-Received-Date: Thu, 28 Jun 2012 17:20:31 -0000
Content-Type: multipart/alternative; boundary=90e6ba6153da74d4c904c38b6523

--90e6ba6153da74d4c904c38b6523
Content-Type: text/plain; charset=UTF-8

On Wednesday, June 27, 2012, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-06-26 at 23:09 -0700, Khem Raj wrote:
>> USE_NLS is generally defined for uclibc based system builds
>> and generally its defined to 'no' there. However this variable
>> does not exist at all for eglibc/glibc distributions. This
>> patch adds a weak definition to 'yes' on eglibc based system
>> builds. This will ease out some of the cryptic contructs we
>> have to define certain options based on USE_NLS and also
>> checking got uclibc at the same time to avoid pythong exceptions
>> when its not defined.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/conf/distro/include/tclibc-eglibc.inc |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/conf/distro/include/tclibc-eglibc.inc
b/meta/conf/distro/include/tclibc-eglibc.inc
>> index 4f5607f..e2ca4e8 100644
>> --- a/meta/conf/distro/include/tclibc-eglibc.inc
>> +++ b/meta/conf/distro/include/tclibc-eglibc.inc
>> @@ -32,6 +32,8 @@ LIBC_LOCALE_DEPENDENCIES = "\
>>       eglibc-gconv-iso8859-1 \
>>       eglibc-gconv-iso8859-15"
>>
>> +USE_NLS ?= "yes"
>> +
>>  def get_libc_locales_dependencies(d):
>>      if 'libc-locales' in (d.getVar('DISTRO_FEATURES', True) or
'').split() :
>>          return d.getVar('LIBC_LOCALE_DEPENDENCIES', True) or ''
>
> Shouldn't this go as a weak default in bitbake.conf?
>
> USE_NLS ??= "yes"
>

I think that would be better I will try that out and update

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--90e6ba6153da74d4c904c38b6523
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, June 27, 2012, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br>&gt; On Tue, 2012-06-26 at 23:09 -0700, Khem Raj wrote:<br>&gt=
;&gt; USE_NLS is generally defined for uclibc based system builds<br>
&gt;&gt; and generally its defined to &#39;no&#39; there. However this vari=
able<br>&gt;&gt; does not exist at all for eglibc/glibc distributions. This=
<br>&gt;&gt; patch adds a weak definition to &#39;yes&#39; on eglibc based =
system<br>
&gt;&gt; builds. This will ease out some of the cryptic contructs we<br>&gt=
;&gt; have to define certain options based on USE_NLS and also<br>&gt;&gt; =
checking got uclibc at the same time to avoid pythong exceptions<br>&gt;&gt=
; when its not defined.<br>
&gt;&gt;<br>&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt; =C2=A0me=
ta/conf/distro/include/tclibc-eglibc.inc | =C2=A0 =C2=A02 ++<br>&gt;&gt; =
=C2=A01 file changed, 2 insertions(+)<br>
&gt;&gt;<br>&gt;&gt; diff --git a/meta/conf/distro/include/tclibc-eglibc.in=
c b/meta/conf/distro/include/tclibc-eglibc.inc<br>&gt;&gt; index 4f5607f..e=
2ca4e8 100644<br>&gt;&gt; --- a/meta/conf/distro/include/tclibc-eglibc.inc<=
br>
&gt;&gt; +++ b/meta/conf/distro/include/tclibc-eglibc.inc<br>&gt;&gt; @@ -3=
2,6 +32,8 @@ LIBC_LOCALE_DEPENDENCIES =3D &quot;\<br>&gt;&gt; =C2=A0 =C2=A0=
 =C2=A0 eglibc-gconv-iso8859-1 \<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 eglibc-gc=
onv-iso8859-15&quot;<br>&gt;&gt;<br>
&gt;&gt; +USE_NLS ?=3D &quot;yes&quot;<br>&gt;&gt; +<br>&gt;&gt; =C2=A0def =
get_libc_locales_dependencies(d):<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0if &#39;l=
ibc-locales&#39; in (d.getVar(&#39;DISTRO_FEATURES&#39;, True) or &#39;&#39=
;).split() :<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return d.getVar(=
&#39;LIBC_LOCALE_DEPENDENCIES&#39;, True) or &#39;&#39;<br>
&gt;<br>&gt; Shouldn&#39;t this go as a weak default in bitbake.conf?<br>&g=
t;<br>&gt; USE_NLS ??=3D &quot;yes&quot;<br>&gt;<br><br>I think that would =
be better I will try that out and update <br><br>&gt; Cheers,<br>&gt;<br>
&gt; Richard<br>&gt;<br>&gt;<br>&gt; ______________________________________=
_________<br>&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:=
Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembed=
ded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>&gt;

--90e6ba6153da74d4c904c38b6523--
