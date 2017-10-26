Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0AC056022F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 19:11:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 26 Oct 2017 12:11:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,301,1505804400"; 
	d="scan'208,217";a="1235749233"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.134])
	([10.219.128.134])
	by fmsmga002.fm.intel.com with ESMTP; 26 Oct 2017 12:11:18 -0700
Date: Thu, 26 Oct 2017 14:21:17 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Anibal =?iso-8859-1?b?TGlt824=?= <limon.anibal@gmail.com>
Message-Id: <1509045677.11251.28@fm-out.intel.com>
In-Reply-To: <CAPS-YPCMmGejwfW-VwE--xNrShxxfyocPaTOrKvBf-cZUxdtVA@mail.gmail.com>
References: <cover.1509034760.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<CAPS-YPCMmGejwfW-VwE--xNrShxxfyocPaTOrKvBf-cZUxdtVA@mail.gmail.com>
X-Mailer: geary/0.11.3
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] scripts/oe-selftest: oe-selftest-internal wrapper scripts that isolates execution
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
X-List-Received-Date: Thu, 26 Oct 2017 19:11:18 -0000
Content-Type: multipart/alternative; boundary="=-XSHzhwMLiaozBC9KvwIT"

--=-XSHzhwMLiaozBC9KvwIT
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable



On Thu, Oct 26, 2017 at 1:44 PM, Anibal Lim=C3=B3n <limon.anibal@gmail.com>=
=20
wrote:
> Hi Leo,
>=20
> The patch looks good at first glance, i have some comments,
>=20
> - We need a way to handle the results output because with this you=20
> will have N results files, may be extend the shell script
> to consolidate the results file.

As a proof of concept I use 'parallel' which fits nicely to this=20
exercise (one job corresponds to one oe-selftest -r) and with this=20
tool, logging can be stored in separate files, each corresponding to a=20
job's stdout/stderr. But the important here is that the tool prints=20
each job's output into the standard output  either=20
first-finished-first-print-to-stdout or keeping the same input order,=20
so at the end, you get the same output as running oe-selftest as a=20
single job.

> - With this if one selftest depends on other there is no way to now=20
> it and the execution will fail, i searched into the selftest cases
> (OETestDepends) and now we don't have dependent cases.

 Think about this approach as running oe-selftest in different build=20
folders with its own metadata and build folder. Under this scenario,=20
the test execution, with the corresponding dependencies will be=20
fulfilled and executed correctly, right? the trade off is some extra=20
work done on each oe-selftest due to dependencies but this wont hurt=20
much in my opinion.

Leo

>=20
> Cheers,
> Anibal
>=20
> On Thu, Oct 26, 2017 at 12:33 PM,=20
> <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>>=20
>> The below is a profiling experiment, running oe-selftest -r (the=20
>> proposed
>> implementation, see patch description for more info):
>>=20
>> Procedure:
>>=20
>> With patch 1/1, multiple oe-selftest jobs can be launched in
>> parallel. One tool that launch jobs in parallel is GNU Parallel [1],=20
>> allowing
>> to construct a simpole pipeline to execute all tests with a pool of=20
>> four
>> jobs:
>>=20
>>     $ echo $ALLTESTS | time parallel --jobs4 oe-selftest -r
>>=20
>> where ALLTESTS is a variable containing all tests cases (modules)=20
>> found by the
>> the runner (oe-selftest-internal) (i.e. ALLTESTS=3D"$(oe-selftest -m |
>> awk '{ print $NF }' | grep -v ':')"). This is the result obtained=20
>> from the
>> above command:
>>=20
>>     739.57user 120.48system 45:34.61elapsed 31%CPU=20
>> (0avgtext+0avgdata 124600maxresident)k
>>     390908inputs+15984336outputs (291major+20227951minor)pagefaults=20
>> 0swaps
>>=20
>>=20
>> The import point on the above numbers is that isolation the=20
>> oe-selftest execution per
>> module and using a parallelization tool, complete oe-selftest runs=20
>> takes less than an hour,
>> beating current single-job times observed at main auto-buildes.
>>=20
>> Profiling results were obtained on a machine with 88 Intel Xeon with=20
>> 88 cores
>>=20
>> [1] https://www.gnu.org/software/parallel/
>>=20
>> The following changes since commit=20
>> 65d23bd7986615fdfb0f1717b615534a2a14ab80:
>>=20
>>   README.qemu: qemuppc64 is not supported (2017-10-16 23:54:31 +0100)
>>=20
>> are available in the git repository at:
>>=20
>>   git://git.yoctoproject.org/poky-contrib=20
>> lsandov1/oe-selftest-own-directory
>>  =20
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dlsandov1/oe-s=
elftest-own-directory
>>=20
>> Leonardo Sandoval (1):
>>   scripts/oe-selftest: oe-selftest-internal wrapper scripts that
>>     isolates execution
>>=20
>>  scripts/oe-selftest          | 102=20
>> +++++++++++++++++++++++--------------------
>>  scripts/oe-selftest-internal |  75 +++++++++++++++++++++++++++++++
>>  2 files changed, 129 insertions(+), 48 deletions(-)
>>  create mode 100755 scripts/oe-selftest-internal
>>=20
>> --
>> 2.12.3
>>=20
>=20
=

--=-XSHzhwMLiaozBC9KvwIT
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable



<br><br>On Thu, Oct 26, 2017 at 1:44 PM, Anibal Lim=C3=B3n &lt;limon.anibal=
@gmail.com&gt; wrote:<br>
<blockquote type=3D"cite"><div dir=3D"ltr"><span style=3D"font-size:12.8px"=
>Hi Leo,</span><div style=3D"font-size:12.8px"><br></div><div style=3D"font=
-size:12.8px">The patch looks good at first glance, i have some comments,</=
div><div style=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8p=
x">- We need a way to handle the results output because with this you will =
have N results files, may be extend the shell script</div><div style=3D"fon=
t-size:12.8px">to consolidate the results file.</div></div></blockquote><di=
v><br></div><div>As a proof of concept I use 'parallel' which fits nicely t=
o this exercise (one job corresponds to one oe-selftest -r) and with this t=
ool, logging can be stored in separate files, each corresponding to a job's=
 stdout/stderr. But the important here is that the tool prints each job's o=
utput into the standard output &nbsp;either first-finished-first-print-to-s=
tdout or keeping the same input order, so at the end, you get the same outp=
ut as running oe-selftest as a single job.</div><br><blockquote type=3D"cit=
e"><div dir=3D"ltr"><div style=3D"font-size:12.8px">- With this if one self=
test depends on other there is no way to now it and the execution will fail=
, i searched into the selftest cases</div><div style=3D"font-size:12.8px">(=
OETestDepends) and now we don't have dependent cases.</div></div></blockquo=
te><div><br></div><div>&nbsp;Think about this approach as running oe-selfte=
st in different build folders with its own metadata and build folder. Under=
 this scenario, the test execution, with the corresponding dependencies wil=
l be fulfilled and executed correctly, right? the trade off is some extra w=
ork done on each oe-selftest due to dependencies but this wont hurt much in=
 my opinion.</div><div><br></div><div>Leo</div><br><blockquote type=3D"cite=
"><div dir=3D"ltr"><div style=3D"font-size:12.8px"><br></div><div style=3D"=
font-size:12.8px">Cheers,</div><div style=3D"font-size:12.8px">Anibal</div>=
</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Oct=
 26, 2017 at 12:33 PM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:leonardo.sa=
ndoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sandoval.gonzal=
ez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
From: Leonardo Sandoval &lt;<a href=3D"mailto:leonardo.sandoval.gonzalez@li=
nux.intel.com">leonardo.sandoval.gonzalez@<wbr>linux.intel.com</a>&gt;<br>
<br>
The below is a profiling experiment, running oe-selftest -r (the proposed<b=
r>
implementation, see patch description for more info):<br>
<br>
Procedure:<br>
<br>
With patch 1/1, multiple oe-selftest jobs can be launched in<br>
parallel. One tool that launch jobs in parallel is GNU Parallel [1], allowi=
ng<br>
to construct a simpole pipeline to execute all tests with a pool of four<br=
>
jobs:<br>
<br>
&nbsp; &nbsp; $ echo $ALLTESTS | time parallel --jobs4 oe-selftest -r<br>
<br>
where ALLTESTS is a variable containing all tests cases (modules) found by =
the<br>
the runner (oe-selftest-internal) (i.e. ALLTESTS=3D"$(oe-selftest -m |<br>
awk '{ print $NF }' | grep -v ':')"). This is the result obtained from the<=
br>
above command:<br>
<br>
&nbsp; &nbsp; 739.57user 120.48system 45:34.61elapsed 31%CPU (0avgtext+0avg=
data 124600maxresident)k<br>
&nbsp; &nbsp; 390908inputs+15984336outputs (291major+20227951minor)<wbr>pag=
efaults 0swaps<br>
<br>
<br>
The import point on the above numbers is that isolation the oe-selftest exe=
cution per<br>
module and using a parallelization tool, complete oe-selftest runs takes le=
ss than an hour,<br>
beating current single-job times observed at main auto-buildes.<br>
<br>
Profiling results were obtained on a machine with 88 Intel Xeon with 88 cor=
es<br>
<br>
[1] <a href=3D"https://www.gnu.org/software/parallel/" rel=3D"noreferrer" t=
arget=3D"_blank">https://www.gnu.org/software/<wbr>parallel/</a><br>
<br>
The following changes since commit 65d23bd7986615fdfb0f1717b61553<wbr>4a2a1=
4ab80:<br>
<br>
&nbsp; README.qemu: qemuppc64 is not supported (2017-10-16 23:54:31 +0100)<=
br>
<br>
are available in the git repository at:<br>
<br>
&nbsp; git://<a href=3D"http://git.yoctoproject.org/poky-contrib" rel=3D"no=
referrer" target=3D"_blank">git.yoctoproject.org/<wbr>poky-contrib</a> lsan=
dov1/oe-selftest-own-<wbr>directory<br>
&nbsp; <a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=
=3Dlsandov1/oe-selftest-own-directory" rel=3D"noreferrer" target=3D"_blank"=
>http://git.yoctoproject.org/<wbr>cgit.cgi/poky-contrib/log/?h=3D<wbr>lsand=
ov1/oe-selftest-own-<wbr>directory</a><br>
<br>
Leonardo Sandoval (1):<br>
&nbsp; scripts/oe-selftest: oe-selftest-internal wrapper scripts that<br>
&nbsp; &nbsp; isolates execution<br>
<br>
&nbsp;scripts/oe-selftest&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 102 +++++++++=
++++++++++++++-------<wbr>-------------<br>
&nbsp;scripts/oe-selftest-internal |&nbsp; 75 +++++++++++++++++++++++++++++=
+<wbr>+<br>
&nbsp;2 files changed, 129 insertions(+), 48 deletions(-)<br>
&nbsp;create mode 100755 scripts/oe-selftest-internal<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.12.3<br>
<br>
</font></span></blockquote></div><br></div>
</blockquote>=

--=-XSHzhwMLiaozBC9KvwIT--
