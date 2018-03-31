Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7EEEA74497
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 04:15:18 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l16so19265260wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 21:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eWSRJANLpWI6pnvlvRBeu374+6PnPwvXdiDnYLzXzPc=;
	b=fXDQH/uwSKkPICu1P/D7bfU4/1vn2TJIfFPcqrVuzrnkFEHZkDANfKINsCnCo/ZJHY
	lPnzPDGYB/r5DeVMpCh8GPClfO223xI0Getn/yZVo6dIKbbvyWOSkFeEqsGQYtK5XPeR
	QMpIyU+4FtpmVYWTkZ8KFcZRU2xd5ao0/lZVv+0kET5zJs9+HBZiWefQVekvs+e6kE1R
	bq7S2OAfp2n9rpS7MJqGbtiunqrsYknZzQ3HDbxrcPDnEGpUEKRMOmQk7PtOyFn6t+uZ
	S2l+RayM1jNl8FWow/rguNLnPHTIM0M2YYZZ6dqP3voM9sWoQxvzECkxSDMCc3Fmz0xl
	BM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eWSRJANLpWI6pnvlvRBeu374+6PnPwvXdiDnYLzXzPc=;
	b=Zj65agA46ju7BNVAKcY19QD0sN1DfJNiBiQYtWo4/HmrSV/7TrOW2d3dI8ZbYlKlt0
	Qs6/5eI95rcX5xH5vGQGlKecjtkQZn0/GGG9ug/h8C6TByzZD1B7oENCBCPt1taIiPCT
	fzmlz4cogEELA/2X269xZ5Umkio1R672CEM0ZSlbGWXDG/otDt6urGRj3dr6AUMuTDfK
	NrGvKFefIF3oASkvJOXC8afIVRK+NuXQhhfOET+8xkEA2hEilvPHrSliEVNQDscbXyxQ
	493CEGbUypQ0QjN+x5861sfT9QV5501Mqz8FftKvLGUxdB+9IOZLulypTKwYwh64TZ4m
	9omg==
X-Gm-Message-State: AElRT7Gw1debXNuO+FEa+XbgwvBZ9neyLtMklL3i5v8w8wdFpO79vvjE
	UFAbjVkPBoyHt+Sb8bslV/3RuBrb8AHVYYE4o+k=
X-Google-Smtp-Source: AIpwx4/301XYzcLOzkVubD5Nmj1D8WyWpEBOjr1txHotSrogvC9/ByAx/uoXsfs9NACG5YqaScr4cCnboZHayKpaje0=
X-Received: by 10.28.170.205 with SMTP id t196mr3859058wme.42.1522469718837;
	Fri, 30 Mar 2018 21:15:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Fri, 30 Mar 2018 21:15:18 -0700 (PDT)
In-Reply-To: <CAJTo0LZUdMAtWKtGnPstotRGiHUPwZ_80PmuSzj5wpAFWGcN0Q@mail.gmail.com>
References: <20180327154802.14611-1-ross.burton@intel.com>
	<CAJ86T=WCAKWoQhxM+2ako7cYJH2RieuGyuLMXcmjNETBidbsaA@mail.gmail.com>
	<CAJTo0LZUdMAtWKtGnPstotRGiHUPwZ_80PmuSzj5wpAFWGcN0Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 30 Mar 2018 21:15:18 -0700
Message-ID: <CAJ86T=WcgEo8SFRLPeRXyFXU-tRwXn0bXdYjiV4D9G19BOWuDg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] pseudo: intercept syscall() and return ENOTSUP for renameat2
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
X-List-Received-Date: Sat, 31 Mar 2018 04:15:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 28, 2018 at 2:15 AM, Burton, Ross <ross.burton@intel.com> wrote:
> With this patch I was getting occasional failures of the pseudo-using
> bitbake-worker, so its not quite ready, but Peter is working on a
> better form anyway.

The "better form" seems to have been committed to the pseudo master
branch. Very interesting...

+long
+syscall(long number, ...) {
+       /* In a fit of optimism, I imagine that if we didn't get at least 7
+        * arguments, reading past the ones we did get will read into this
+        * space and maybe not clash with or overlap with any later-declared
+        * values. This isn't really a guarantee, and is probably just
+        * superstition.
+        */
+       unsigned long long padding[7];
+       (void) padding;

Arguments passed by the caller will be put on the stack before any
stack frame is created by the callee. You can argue about which way a
stack grows (up or down) but however you define it, reading past the
end of the arguments passed on the stack by the caller is never going
to read into the stack frame created by the callee, so this can't have
the intended affect.

Also... any compiler from at least the past 20 years or so is going to
optimise away unused variables, so this does precisely nothing anyway.

+       /* gcc magic to attempt to just pass these args to syscall. we have to
+        * guess about the number of args; the docs discuss calling conventions
+        * up to 7, so let's try that?
+        */
+       void *res = __builtin_apply((void (*)()) real_syscall,
__builtin_apply_args(), sizeof(long long) * 7);
+       __builtin_return(res);

This is probably going to work, but if the goal is to avoid reading
more from the stack than the generic C code would do, it doesn't
succeed. The "size" parameter to __builtin_apply() seems to simply
specify how much argument data to copy from the stack frame passed by
the caller. Setting it to sizeof(long long) * 7 is safe (ie it will
copy at least enough data from the stack frame passed by the caller,
never less) as it covers both the corner cases where registers are
long long (such as x32) and where _no_ arguments are passed in
registers and everything needs to be copied from the stack. However,
on 32bit targets (where registers are smaller than long long) and on
any target where _some_ arguments are passed via registers, it will
cause more data to be read from the stack than the generic C code
would.

e.g. on 32bit ARM where the first 4 integer arguments are passed via
registers, the optimum value for __builtin_apply() "size" in order to
pass through 1 syscall number and 6 additional register sized
arguments would be sizeof(long) * 3.

A simple test built for 32bit ARM seems to confirm that. The generic
code unconditionally reads 12 bytes from the stack frame passed by the
caller. The code now in pseudo master unconditionally reads 56 bytes.

$ cat tst.c
#include <stdarg.h>

extern int real_syscall();

typedef long syscall_arg_t; /* fixme: wrong for x32 */

int wrapper_generic (long int n, ...)
{
    va_list ap;
    syscall_arg_t a,b,c,d,e,f;
    va_start(ap, n);
    a=va_arg(ap, syscall_arg_t);
    b=va_arg(ap, syscall_arg_t);
    c=va_arg(ap, syscall_arg_t);
    d=va_arg(ap, syscall_arg_t);
    e=va_arg(ap, syscall_arg_t);
    f=va_arg(ap, syscall_arg_t);
    va_end(ap);
    return real_syscall(n,a,b,c,d,e,f);
}

int wrapper_gcc_specific (long int n, ...)
{
    void *res = __builtin_apply((void (*)()) real_syscall,
__builtin_apply_args(), sizeof(long long) * 7);
    __builtin_return(res);
}

$ arm-linux-gnueabi-objdump -d tst.o

tst.o:     file format elf32-littlearm

Disassembly of section .text:

00000000 <wrapper_generic>:
   0:    e92d000f     push    {r0, r1, r2, r3}
   4:    e92d407f     push    {r0, r1, r2, r3, r4, r5, r6, lr}
   8:    e28d0020     add    r0, sp, #32
   c:    e59d3038     ldr    r3, [sp, #56]    ; 0x38
  10:    e28d2024     add    r2, sp, #36    ; 0x24
  14:    e58d2014     str    r2, [sp, #20]
  18:    e58d3008     str    r3, [sp, #8]
  1c:    e59d3034     ldr    r3, [sp, #52]    ; 0x34
  20:    e58d3004     str    r3, [sp, #4]
  24:    e59d3030     ldr    r3, [sp, #48]    ; 0x30
  28:    e58d3000     str    r3, [sp]
  2c:    e890000f     ldm    r0, {r0, r1, r2, r3}
  30:    ebfffffe     bl    0 <real_syscall>
  34:    e28dd01c     add    sp, sp, #28
  38:    e49de004     pop    {lr}        ; (ldr lr, [sp], #4)
  3c:    e28dd010     add    sp, sp, #16
  40:    e12fff1e     bx    lr

00000044 <wrapper_gcc_specific>:
  44:    e92d000f     push    {r0, r1, r2, r3}
  48:    e92d4830     push    {r4, r5, fp, lr}
  4c:    e28db00c     add    fp, sp, #12
  50:    e24b400c     sub    r4, fp, #12
  54:    e28bc014     add    ip, fp, #20
  58:    e24dd028     sub    sp, sp, #40    ; 0x28
  5c:    e50b0020     str    r0, [fp, #-32]    ; 0xffffffe0
  60:    e1a0500d     mov    r5, sp
  64:    e50b101c     str    r1, [fp, #-28]    ; 0xffffffe4
  68:    e24dd040     sub    sp, sp, #64    ; 0x40
  6c:    e50b2018     str    r2, [fp, #-24]    ; 0xffffffe8
  70:    e1a0e00d     mov    lr, sp
  74:    e50b3014     str    r3, [fp, #-20]    ; 0xffffffec
  78:    e524c018     str    ip, [r4, #-24]!    ; 0xffffffe8
  7c:    e8bc000f     ldm    ip!, {r0, r1, r2, r3}
  80:    e8ae000f     stmia    lr!, {r0, r1, r2, r3}
  84:    e8bc000f     ldm    ip!, {r0, r1, r2, r3}
  88:    e8ae000f     stmia    lr!, {r0, r1, r2, r3}
  8c:    e8bc000f     ldm    ip!, {r0, r1, r2, r3}
  90:    e8ae000f     stmia    lr!, {r0, r1, r2, r3}
  94:    e89c0003     ldm    ip, {r0, r1}
  98:    e88e0003     stm    lr, {r0, r1}
  9c:    e994000f     ldmib    r4, {r0, r1, r2, r3}
  a0:    e24b4034     sub    r4, fp, #52    ; 0x34
  a4:    ebfffffe     bl    0 <real_syscall>
  a8:    e884000f     stm    r4, {r0, r1, r2, r3}
  ac:    e1a0d005     mov    sp, r5
  b0:    e894000f     ldm    r4, {r0, r1, r2, r3}
  b4:    e24bd00c     sub    sp, fp, #12
  b8:    e8bd4830     pop    {r4, r5, fp, lr}
  bc:    e28dd010     add    sp, sp, #16
  c0:    e12fff1e     bx    lr


(Note in the code was compiled with -mfloat-abi=soft to avoid
__builtin_apply() needing to save and restore all floating point
registers - which doesn't affect the amount of data read from the
stack, but makes the assembler more than twice as long...).

