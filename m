Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TiiNZ-0001Ki-GG
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 10:13:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBC8wqMB002848
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 00:58:52 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 12 Dec 2012 00:58:50 -0800
Message-ID: <50C84753.5090700@windriver.com>
Date: Wed, 12 Dec 2012 16:58:59 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1354531187.git.Qi.Chen@windriver.com>
	<4973f2f88641f8a8c02b0062b31f159977d9ba0a.1354531187.git.Qi.Chen@windriver.com>
	<50C6126F.3020401@linux.intel.com>
	<50C657CD.2040103@linux.intel.com>
	<CALbNGRT1RmSpKaH9ZJf+aaDoNddqgQckUR2BK8sYCc3em4b-8A@mail.gmail.com>
	<50C69367.7000801@linux.intel.com> <50C844E0.2080904@windriver.com>
In-Reply-To: <50C844E0.2080904@windriver.com>
X-Originating-IP: [128.224.163.154]
Subject: Re: [PATCH 2/4] ICU: add pkgconfig support
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
X-List-Received-Date: Wed, 12 Dec 2012 09:13:25 -0000
Content-Type: multipart/alternative;
	boundary="------------060308080505070400070005"

--------------060308080505070400070005
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id qBC8wqMB002848

On 12/12/2012 04:48 PM, ChenQi wrote:
> On 12/11/2012 09:59 AM, Saul Wold wrote:
>> On 12/10/2012 05:07 PM, Andreas M=FCller wrote:
>>> On Mon, Dec 10, 2012 at 10:44 PM, Saul Wold <sgw@linux.intel.com>=20
>>> wrote:
>>>> On 12/10/2012 08:48 AM, Saul Wold wrote:
>>>>>
>>>>> On 12/04/2012 12:46 AM, Qi.Chen@windriver.com wrote:
>>>>>>
>> <SNIP>
>>>>>>               "
>>>>>>    SRC_URI =3D "${BASE_SRC_URI} \
>>>>>>               file://noldlibpath.patch \
>>>>>> @@ -28,6 +29,12 @@ inherit autotools pkgconfig binconfig
>>>>>>    do_configure() {
>>>>>>        libtoolize --force
>>>>>>        gnu-configize --force
>>>>>> +    if [ "${PN}" !=3D "icu-native" ]; then
>>>>>> +        OLD=3D`pwd`
>>>>>> +        cd ${S}
>>>>>> +        autoconf
>>>>>> +        cd ${OLD}
>>>>>> +    fi
>>>>
>>>>
>>>> I had some time this morning to investigate this more deeply.  What=20
>>>> I found
>>>> was that the ICU tarball was being delivered with a "configure" and=20
>>>> that the
>>>> do_configure was avoiding the "autoconf" conversion of configure.in =
->
>>>> configure.  I am not sure if this is historical or if this is truly=20
>>>> needed.
>>>>
>>>> So by doing the autoconf above you changed the "configure" script,=20
>>>> this in
>>>> turn caused some configuration changes to occur in the platform.h=20
>>>> file.  Why
>>>> these changed (particularly the U_HAVE_NAMESPACE define) then=20
>>>> caused the ICU
>>>> libraries to be built with different namespace.
>>>>
>>>> So a couple of key questions that need to be resolved:
>>>> 1) Will updating to 4.6 solve this issue, if not then we need to=20
>>>> dive into 2
>>>> + 3 Below:
>>>>
>>>> 2) Why does icu tarball have a generated configure?
>>>>
>>>> 3) Why does the autoconf generated configure fail to configure thing=
s
>>>> correctly?
>>>>
>>>> Sau!
>>>>
>>> Also got this error but reported it to the wrong mailing list - sorry.
>>> I also looked around for this. The patch added pkg-config to icu. Jus=
t
>>> a guess: webkit-gtk fails due to a mixture of renamed symbols
>>> (EventListener_3_6 - see sysroot/usr/include/unicode/urename.h) and
>>> unrenamed symbols. Before the icu-patch this did not happen because
>>> (icu's) urename.h was not included and no symbols were renamed or
>>> renamed differently. My problem: The error gives me information about
>>> renamed symbol but I did not yet find the time to search for
>>> unrenamed. As I said: Just a guess
>>>
>> I am not sure that's it, the renaming is actually in the NAMESPACE,=20
>> the older (no pkg-config) sets HAVE_NAMESPACE in the platform.h file=20
>> and then the symbols have icu_2_6 in them, that's the real issue,=20
>> which is caused by running autoconf and getting a bad/wrong=20
>> "configure" script vs the one suplied in the tarball.
>>
>> Sau!
>>
>>> Andreas
>>>
>>>
>>
> Hi Saul,
>
> The errors are:
> configure.in:219: error: possibly undefined macro:=20
> AC_CHECK_STRICT_COMPILE
>       If this token and others are legitimate, please use=20
> m4_pattern_allow.
>       See the Autoconf documentation.
> configure.in:222: error: possibly undefined macro: AC_CHECK_64BIT_LIBS
> configure.in:492: error: possibly undefined macro: AC_SEARCH_LIBS_FIRST
>

Ah.... I see the problem. Our autoconf version is 2.69 while this=20
configure.ac file needs 2.68.
> The recipe's in attachment.
>
> I first tried it on my own computer without yocto, everything's OK.=20
> The autoconf-generated configure is the same with the shipped one. So=20
> I figured maybe we don't need to override the do_configure and=20
> do_compile method here.
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------060308080505070400070005
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 12/12/2012 04:48 PM, ChenQi wrote:
    <blockquote cite="mid:50C844E0.2080904@windriver.com" type="cite">On
      12/11/2012 09:59 AM, Saul Wold wrote:
      <br>
      <blockquote type="cite">On 12/10/2012 05:07 PM, Andreas M&uuml;ller
        wrote:
        <br>
        <blockquote type="cite">On Mon, Dec 10, 2012 at 10:44 PM, Saul
          Wold <a class="moz-txt-link-rfc2396E" href="mailto:sgw@linux.intel.com">&lt;sgw@linux.intel.com&gt;</a> wrote:
          <br>
          <blockquote type="cite">On 12/10/2012 08:48 AM, Saul Wold
            wrote:
            <br>
            <blockquote type="cite">
              <br>
              On 12/04/2012 12:46 AM, <a class="moz-txt-link-abbreviated" href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a> wrote:
              <br>
              <blockquote type="cite">
                <br>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
        &lt;SNIP&gt;
        <br>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
                <br>
                &nbsp;&nbsp; SRC_URI = "${BASE_SRC_URI} \
                <br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-freetext" href="file://noldlibpath.patch">file://noldlibpath.patch</a> \
                <br>
                @@ -28,6 +29,12 @@ inherit autotools pkgconfig binconfig
                <br>
                &nbsp;&nbsp; do_configure() {
                <br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libtoolize --force
                <br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gnu-configize --force
                <br>
                +&nbsp;&nbsp;&nbsp; if [ "${PN}" != "icu-native" ]; then
                <br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OLD=`pwd`
                <br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cd ${S}
                <br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; autoconf
                <br>
                +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cd ${OLD}
                <br>
                +&nbsp;&nbsp;&nbsp; fi
                <br>
              </blockquote>
            </blockquote>
            <br>
            <br>
            I had some time this morning to investigate this more
            deeply.&nbsp; What I found
            <br>
            was that the ICU tarball was being delivered with a
            "configure" and that the
            <br>
            do_configure was avoiding the "autoconf" conversion of
            configure.in -&gt;
            <br>
            configure.&nbsp; I am not sure if this is historical or if this
            is truly needed.
            <br>
            <br>
            So by doing the autoconf above you changed the "configure"
            script, this in
            <br>
            turn caused some configuration changes to occur in the
            platform.h file.&nbsp; Why
            <br>
            these changed (particularly the U_HAVE_NAMESPACE define)
            then caused the ICU
            <br>
            libraries to be built with different namespace.
            <br>
            <br>
            So a couple of key questions that need to be resolved:
            <br>
            1) Will updating to 4.6 solve this issue, if not then we
            need to dive into 2
            <br>
            + 3 Below:
            <br>
            <br>
            2) Why does icu tarball have a generated configure?
            <br>
            <br>
            3) Why does the autoconf generated configure fail to
            configure things
            <br>
            correctly?
            <br>
            <br>
            Sau!
            <br>
            <br>
          </blockquote>
          Also got this error but reported it to the wrong mailing list
          - sorry.
          <br>
          I also looked around for this. The patch added pkg-config to
          icu. Just
          <br>
          a guess: webkit-gtk fails due to a mixture of renamed symbols
          <br>
          (EventListener_3_6 - see
          sysroot/usr/include/unicode/urename.h) and
          <br>
          unrenamed symbols. Before the icu-patch this did not happen
          because
          <br>
          (icu's) urename.h was not included and no symbols were renamed
          or
          <br>
          renamed differently. My problem: The error gives me
          information about
          <br>
          renamed symbol but I did not yet find the time to search for
          <br>
          unrenamed. As I said: Just a guess
          <br>
          <br>
        </blockquote>
        I am not sure that's it, the renaming is actually in the
        NAMESPACE, the older (no pkg-config) sets HAVE_NAMESPACE in the
        platform.h file and then the symbols have icu_2_6 in them,
        that's the real issue, which is caused by running autoconf and
        getting a bad/wrong "configure" script vs the one suplied in the
        tarball.
        <br>
        <br>
        Sau!
        <br>
        <br>
        <blockquote type="cite">Andreas
          <br>
          <br>
          <br>
        </blockquote>
        <br>
      </blockquote>
      Hi Saul,
      <br>
      <br>
      The errors are:
      <br>
      configure.in:219: error: possibly undefined macro:
      AC_CHECK_STRICT_COMPILE
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; If this token and others are legitimate, please use
      m4_pattern_allow.
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; See the Autoconf documentation.
      <br>
      configure.in:222: error: possibly undefined macro:
      AC_CHECK_64BIT_LIBS
      <br>
      configure.in:492: error: possibly undefined macro:
      AC_SEARCH_LIBS_FIRST
      <br>
      <br>
    </blockquote>
    <br>
    Ah.... I see the problem. Our autoconf version is 2.69 while this
    configure.ac file needs 2.68.<br>
    <blockquote cite="mid:50C844E0.2080904@windriver.com" type="cite">The
      recipe's in attachment.
      <br>
      <br>
      I first tried it on my own computer without yocto, everything's
      OK. The autoconf-generated configure is the same with the shipped
      one. So I figured maybe we don't need to override the do_configure
      and do_compile method here.
      <br>
      <br>
      <br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------060308080505070400070005--
