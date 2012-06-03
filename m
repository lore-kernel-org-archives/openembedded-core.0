Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Saz9l-00088P-0R
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Jun 2012 02:58:57 +0200
Received: by eaal1 with SMTP id l1so859283eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jun 2012 17:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Q4OMuxadjNB7Ok/KnUb+t1Dxm5snlfYFRqgkDUYZeWA=;
	b=x4zNvrkek5FLywRMo9qPtuHEuvUzIiffVLtioHwMucAzpwHJpAkJHaSnxVpZSsP3Aw
	iyTF0eNZw+n44/rSAb/P43m+vLe2NTdNoqVix2j2KLsndFzy2mrJirfBOUcTBTn/AohJ
	cxWxl+cR15O1+xgSgnKg82TnnYMvksZjx7ACauF6r7huqu7nUFABNplwrS2c7TSEtajG
	+SxYHDdBXOmTGIYdY36+yujC/ulBIx2/oW8zwHZQSz2AkVbWaXjMJuFrVVYZE8lBxjUO
	tpGegKl9xSE6aIFkFOPTsklg/sUdisNzQWL+SmllbtedO9ayJZz1goCXO0tL4kwkAPXU
	nXEQ==
MIME-Version: 1.0
Received: by 10.14.99.200 with SMTP id x48mr1940420eef.77.1338684514070; Sat,
	02 Jun 2012 17:48:34 -0700 (PDT)
Received: by 10.14.188.11 with HTTP; Sat, 2 Jun 2012 17:48:33 -0700 (PDT)
In-Reply-To: <E100C99B-7213-4B02-A6FF-C9878DF57562@gmail.com>
References: <56B3703F-09C3-4A9E-BF97-17DBBBE8C9AF@gmail.com>
	<A9C91AFD-F965-453F-A418-981EB6399247@gmail.com>
	<E100C99B-7213-4B02-A6FF-C9878DF57562@gmail.com>
Date: Sat, 2 Jun 2012 17:48:33 -0700
Message-ID: <CAMKF1sowgNZZqCYgJMZv=czABU0r1J+8ELUDQQYY0THwef-QVQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-xilinx] How to debug the value of ${TARGET_ARCH} in meta-xilinx/classes/xilinx-boot.class
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
X-List-Received-Date: Sun, 03 Jun 2012 00:58:57 -0000
Content-Type: multipart/alternative; boundary=bcaec52c6a5bed703104c186c681

--bcaec52c6a5bed703104c186c681
Content-Type: text/plain; charset=UTF-8

On Saturday, June 2, 2012, Elvis Dowson <elvis.dowson@gmail.com> wrote:
> Hi,
>
>> On Jun 2, 2012, at 10:36 PM, Elvis Dowson wrote:
>>
>>> How can I debug the value of ${TARGET_ARCH} in
meta-xilinx/classes/xilinx-boot.class, for the following function:
>>>
>>> do_export_xparam() {
>>> bbnote "Replacing xparameters header to match hardware model"
>>> xparam=$1
>>> if [ "${TARGET_ARCH}" == "powerpc" ]; then
>>>      cpu="PPC`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`"
>>> else
>>>      cpu=`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`
>>> fi
>>> cp ${xparam} ${S}/board/xilinx/${XILINX_BOARD}
>>> echo "/*** Cannonical definitions ***/
>>> #define XPAR_PLB_CLOCK_FREQ_HZ XPAR_PROC_BUS_0_FREQ_HZ
>>> #define XPAR_CORE_CLOCK_FREQ_HZ XPAR_CPU_${cpu}_CORE_CLOCK_FREQ_HZ
>>> #ifndef XPAR_DDR2_SDRAM_MEM_BASEADDR
>>> # define XPAR_DDR2_SDRAM_MEM_BASEADDR XPAR_DDR_SDRAM_MPMC_BASEADDR
>>> #endif
>>> #define XPAR_PCI_0_CLOCK_FREQ_HZ    0" >>
${S}/board/xilinx/${XILINX_BOARD}/xparameters.h
>>> }
>>
>> In the above code ${TARGET_ARCH} always evaluates to "powerpc". I just
inserted ${TARGET_ARCH} in the echo statements, and saw the value in the
file.
>>
>> Now what I can't seem to figure out is why, for the following if
condition, the first branch isn't being take; the else branch is always
evaluated, and the value for cpu is always set to "440" instead of "PPC440"
>>
>> if [ "${TARGET_ARCH}" == "powerpc" ]; then
>>       cpu="PPC`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`"
>> else
>>       cpu="`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`"
>> fi
>
> Changing it to use a single = , instead of == solved it, but it would
help if someone could explain why. From the link below
> http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html
> apparently, using a "=" is for strict posix compilance.
>
> but I fail to see why when ${TARGET_ARCH} evaluates to "powerpc", and I
do a string comparision if [ "${TARGET_ARCH}" == "powerpc" ] it evaluates
to false, and if [ "${TARGET_ARCH}" = "powerpc" ] evaluates to true.


What's your default she I guess its not bash
>
> Best regards,
>
> Elvis Dowson
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--bcaec52c6a5bed703104c186c681
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Saturday, June 2, 2012, Elvis Dowson &lt;<a href=3D"mailto:elvis=
.dowson@gmail.com">elvis.dowson@gmail.com</a>&gt; wrote:<br>&gt; Hi,<br>&gt=
;<br>&gt;&gt; On Jun 2, 2012, at 10:36 PM, Elvis Dowson wrote:<br>&gt;&gt;<=
br>
&gt;&gt;&gt; How can I debug the value of ${TARGET_ARCH} in meta-xilinx/cla=
sses/xilinx-boot.class, for the following function:<br>&gt;&gt;&gt;<br>&gt;=
&gt;&gt; do_export_xparam() {<br>&gt;&gt;&gt; bbnote &quot;Replacing xparam=
eters header to match hardware model&quot;<br>
&gt;&gt;&gt; xparam=3D$1<br>&gt;&gt;&gt; if [ &quot;${TARGET_ARCH}&quot; =
=3D=3D &quot;powerpc&quot; ]; then<br>&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0cpu=
=3D&quot;PPC`echo ${TARGET_CPU} | tr &#39;[:lower:]&#39; &#39;[:upper:]&#39=
;`&quot;<br>&gt;&gt;&gt; else<br>
&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0cpu=3D`echo ${TARGET_CPU} | tr &#39;[:lowe=
r:]&#39; &#39;[:upper:]&#39;`<br>&gt;&gt;&gt; fi<br>&gt;&gt;&gt; cp ${xpara=
m} ${S}/board/xilinx/${XILINX_BOARD}<br>&gt;&gt;&gt; echo &quot;/*** Cannon=
ical definitions ***/<br>
&gt;&gt;&gt; #define XPAR_PLB_CLOCK_FREQ_HZ XPAR_PROC_BUS_0_FREQ_HZ<br>&gt;=
&gt;&gt; #define XPAR_CORE_CLOCK_FREQ_HZ XPAR_CPU_${cpu}_CORE_CLOCK_FREQ_HZ=
<br>&gt;&gt;&gt; #ifndef XPAR_DDR2_SDRAM_MEM_BASEADDR<br>&gt;&gt;&gt; # def=
ine XPAR_DDR2_SDRAM_MEM_BASEADDR XPAR_DDR_SDRAM_MPMC_BASEADDR<br>
&gt;&gt;&gt; #endif<br>&gt;&gt;&gt; #define XPAR_PCI_0_CLOCK_FREQ_HZ =C2=A0=
 =C2=A00&quot; &gt;&gt; ${S}/board/xilinx/${XILINX_BOARD}/xparameters.h<br>=
&gt;&gt;&gt; }<br>&gt;&gt;<br>&gt;&gt; In the above code ${TARGET_ARCH} alw=
ays evaluates to &quot;powerpc&quot;. I just inserted ${TARGET_ARCH} in the=
 echo statements, and saw the value in the file.<br>
&gt;&gt;<br>&gt;&gt; Now what I can&#39;t seem to figure out is why, for th=
e following if condition, the first branch isn&#39;t being take; the else b=
ranch is always evaluated, and the value for cpu is always set to &quot;440=
&quot; instead of &quot;PPC440&quot;<br>
&gt;&gt;<br>&gt;&gt; if [ &quot;${TARGET_ARCH}&quot; =3D=3D &quot;powerpc&q=
uot; ]; then<br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 cpu=3D&quot;PPC`echo ${TARGET=
_CPU} | tr &#39;[:lower:]&#39; &#39;[:upper:]&#39;`&quot;<br>&gt;&gt; else<=
br>&gt;&gt; =C2=A0 =C2=A0 =C2=A0 cpu=3D&quot;`echo ${TARGET_CPU} | tr &#39;=
[:lower:]&#39; &#39;[:upper:]&#39;`&quot;<br>
&gt;&gt; fi<br>&gt;<br>&gt; Changing it to use a single =3D , instead of =
=3D=3D solved it, but it would help if someone could explain why. From the =
link below<br>&gt; <a href=3D"http://tldp.org/LDP/Bash-Beginners-Guide/html=
/sect_07_01.html">http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.=
html</a><br>
&gt; apparently, using a &quot;=3D&quot; is for strict posix compilance.<br=
>&gt;<br>&gt; but I fail to see why when ${TARGET_ARCH} evaluates to &quot;=
powerpc&quot;, and I do a string comparision if [ &quot;${TARGET_ARCH}&quot=
; =3D=3D &quot;powerpc&quot; ] it evaluates to false, and if [ &quot;${TARG=
ET_ARCH}&quot; =3D &quot;powerpc&quot; ] evaluates to true.<br>
<br><br>What&#39;s your default she I guess its not bash<br>&gt;<br>&gt; Be=
st regards,<br>&gt;<br>&gt; Elvis Dowson<br>&gt; __________________________=
_____________________<br>&gt; Openembedded-core mailing list<br>&gt; <a hre=
f=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lis=
ts.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>&gt;

--bcaec52c6a5bed703104c186c681--
