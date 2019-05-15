Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4ABAC6025E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 19:12:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4FJBvd8000989
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 May 2019 12:12:12 -0700
Received: from [128.224.56.208] (128.224.56.208) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 15 May 2019 12:11:49 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>, "Yang, Liezhi"
	<Liezhi.Yang@windriver.com>, "Burton, Ross" <ross.burton@intel.com>, "Hao,
	Kexin" <Kexin.Hao@windriver.com>
References: <20190514035716.27376-1-Randy.MacLeod@windriver.com>
	<20190514035716.27376-2-Randy.MacLeod@windriver.com>
	<4588fa927b2e10223bab39d65aab4184db783f49.camel@linuxfoundation.org>
	<8f1030b6-b831-7ac8-88e3-1208272d7533@windriver.com>
	<19e3463fcf6a41f0c35b7227760bd1f2cf6aeac5.camel@linuxfoundation.org>
	<c6d172d4-80f4-d91b-662f-b9b1de85f032@windriver.com>
	<0332c9bc1d4a9d3b841a1afb658dfd952e2e3d80.camel@linuxfoundation.org>
	<ff3995a4-6c30-0e36-53ad-d02f7d037f81@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <67d2a4e8-7101-f16c-a734-f3a75c17ba24@windriver.com>
Date: Wed, 15 May 2019 15:11:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ff3995a4-6c30-0e36-53ad-d02f7d037f81@windriver.com>
X-Originating-IP: [128.224.56.208]
Subject: Re: [PATCH 2/5] valgrind: do not strip the package or ptests
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
X-List-Received-Date: Wed, 15 May 2019 19:12:55 -0000
Content-Type: multipart/alternative;
	boundary="------------83345446BF618AE264142F03"
Content-Language: en-GB

--------------83345446BF618AE264142F03
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/14/19 10:22 PM, Randy MacLeod wrote:
> ...

> It's tempting to just bump the timeout to 300 seconds
> since anything that fails with that timeout really should
> be fixed. The right thing is to pass the timeout from ptest-runner
> down to valgrind's vg_regtest script. If we have people who set
> timeouts to a non-default value and will be running valgrind's
> ptest then I could do that.
>
> Since I'm a completist, I'm going to try qemumips64 next! :)

Okay, so maybe I'm not a MIPS64 completist!


qemumips64 hangs on drd/tests/annotate_barrier. I'm not sure why.

When run under gdb:

(gdb) bt
#0  vgPlain_machine_get_hwcaps () at ../../valgrind-3.15.0/coregrind/m_machine.c:1910
#1  0x00000000580b5a80 in valgrind_main (argc=<optimized out>, argv=0x580bb430 <_start_in_C_linux+224>, envp=0x120015520)
     at ../../valgrind-3.15.0/coregrind/m_main.c:1375
#2  0x00000000580bb430 in _start_in_C_linux (pArgc=0xffffffabe0) at ../../valgrind-3.15.0/coregrind/m_main.c:2985
#3  0x00000000580b47e8 in __start ()
Backtrace stopped: frame did not save the PC
(gdb) bt full
#0  vgPlain_machine_get_hwcaps () at ../../valgrind-3.15.0/coregrind/m_machine.c:1910
         have_MSA = 1 '\001'
         saved_set = {sig = {0, 0}}
         tmp_set = {sig = {8, 0}}
         saved_sigill_act = {sa_flags = 0, ksa_handler = 0x0, sa_mask = {sig = {0, 0}}, sa_restorer = 0xffffffae8e}
         tmp_sigill_act = {sa_flags = 1073741824, ksa_handler = 0x58036f90 <handler_unsup_insn>, sa_mask = {sig = {0, 0}}, sa_restorer = 0xffffffae8e}
         r = <optimized out>
         __PRETTY_FUNCTION__ = "vgPlain_machine_get_hwcaps"


1905          /* MSA instructions */
1906          have_MSA = True;
1907          if  (VG_MINIMAL_SETJMP(env_unsup_insn)) {
1908             have_MSA = False;
1909          }else  {
1910             __asm__ __volatile__(".word 0x7800088E");/* addv.b w2, w1, w0 */
1911          }

The qemumips64 ptests for valgrind are now on the back burner.

-- 
# Randy MacLeod
# Wind River Linux


--------------83345446BF618AE264142F03
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 5/14/19 10:22 PM, Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ff3995a4-6c30-0e36-53ad-d02f7d037f81@windriver.com">...<br>
    </blockquote>
    <br>
    <blockquote type="cite"
      cite="mid:ff3995a4-6c30-0e36-53ad-d02f7d037f81@windriver.com">It's
      tempting to just bump the timeout to 300 seconds
      <br>
      since anything that fails with that timeout really should
      <br>
      be fixed. The right thing is to pass the timeout from ptest-runner
      <br>
      down to valgrind's vg_regtest script. If we have people who set
      <br>
      timeouts to a non-default value and will be running valgrind's
      <br>
      ptest then I could do that.
      <br>
      <br>
      Since I'm a completist, I'm going to try qemumips64 next! :)
      <br>
    </blockquote>
    <p>Okay, so maybe I'm not a MIPS64 completist! <br>
    </p>
    <p><br>
    </p>
    <p>qemumips64 hangs on drd/tests/annotate_barrier. I'm not sure why.</p>
    <p>When run under gdb:<br>
    </p>
    <pre>(gdb) bt
#0  vgPlain_machine_get_hwcaps () at ../../valgrind-3.15.0/coregrind/m_machine.c:1910
#1  0x00000000580b5a80 in valgrind_main (argc=&lt;optimized out&gt;, argv=0x580bb430 &lt;_start_in_C_linux+224&gt;, envp=0x120015520)
    at ../../valgrind-3.15.0/coregrind/m_main.c:1375
#2  0x00000000580bb430 in _start_in_C_linux (pArgc=0xffffffabe0) at ../../valgrind-3.15.0/coregrind/m_main.c:2985
#3  0x00000000580b47e8 in __start ()
Backtrace stopped: frame did not save the PC
(gdb) bt full
#0  vgPlain_machine_get_hwcaps () at ../../valgrind-3.15.0/coregrind/m_machine.c:1910
        have_MSA = 1 '\001'
        saved_set = {sig = {0, 0}}
        tmp_set = {sig = {8, 0}}
        saved_sigill_act = {sa_flags = 0, ksa_handler = 0x0, sa_mask = {sig = {0, 0}}, sa_restorer = 0xffffffae8e}
        tmp_sigill_act = {sa_flags = 1073741824, ksa_handler = 0x58036f90 &lt;handler_unsup_insn&gt;, sa_mask = {sig = {0, 0}}, sa_restorer = 0xffffffae8e}
        r = &lt;optimized out&gt;
        __PRETTY_FUNCTION__ = "vgPlain_machine_get_hwcaps"


<font color="#FCE94F">1905 </font>        <font color="#34E2E2">/* MSA instructions */</font>
<font color="#FCE94F">1906 </font>        have_MSA = True;
<font color="#FCE94F">1907 </font>        <font color="#FCE94F">if</font> (VG_MINIMAL_SETJMP(env_unsup_insn)) {
<font color="#FCE94F">1908 </font>           have_MSA = False;
<font color="#FCE94F">1909 </font>        } <font color="#FCE94F">else</font> {
<font color="#FCE94F">1910 </font>           __asm__ __volatile__(<font color="#AD7FA8">".word 0x7800088E"</font>); <font color="#34E2E2">/* addv.b w2, w1, w0 */</font>
<font color="#FCE94F">1911 </font>        }
</pre>
    <pre class="moz-signature" cols="72">
The qemumips64 ptests for valgrind are now on the back burner.

-- 
# Randy MacLeod
# Wind River Linux
</pre>
  </body>
</html>

--------------83345446BF618AE264142F03--
