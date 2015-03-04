Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id AA98460144
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 15:04:24 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 4 Mar 2015
	16:04:22 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id 1D41B2800CB;
	Wed,  4 Mar 2015 16:04:22 +0100 (CET)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Mar 2015 16:04:20 +0100
Message-ID: <1425481460-33631-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [dizzy] [PATCH 1/1] python: Add support for aarch64 for ctypes module
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
X-List-Received-Date: Wed, 04 Mar 2015 15:04:26 -0000
Content-Type: text/plain

Python have its own version of libffi used for ctypes module.
libffi 3.0.10 contained in original source of Python-2.7.3 does not have
support for aarch64 architecture.
This is patch is backport support for aarch64 from libffi 3.1
---
 .../python/python/ctypes-libffi-aarch64.patch      |   22 +
 .../python/python/libffi-aarch64.patch             | 1608 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.3.bb       |    2 +
 3 files changed, 1632 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/ctypes-libffi-aarch64.patch
 create mode 100644 meta/recipes-devtools/python/python/libffi-aarch64.patch

diff --git a/meta/recipes-devtools/python/python/ctypes-libffi-aarch64.patch b/meta/recipes-devtools/python/python/ctypes-libffi-aarch64.patch
new file mode 100644
index 0000000..7349c7b
--- /dev/null
+++ b/meta/recipes-devtools/python/python/ctypes-libffi-aarch64.patch
@@ -0,0 +1,22 @@
+Add missing fficonfig.py bits for aarch64
+
+# HG changeset patch
+# User Andreas Schwab <schwab@suse.de>
+# Date 1367276434 -7200
+# Node ID 05e8999a3901b4853e60d6701510e9b3dd54a7f3
+# Parent  84cef4f1999ad9e362694cdac2f65f0981e3d5d0
+
+Upstream-Status: Backport
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+
+diff -r 84cef4f1999a -r 05e8999a3901 Modules/_ctypes/libffi/fficonfig.py.in
+--- a/Modules/_ctypes/libffi/fficonfig.py.in	Mon Apr 29 16:09:39 2013 -0400
++++ b/Modules/_ctypes/libffi/fficonfig.py.in	Tue Apr 30 01:00:34 2013 +0200
+@@ -28,6 +28,7 @@
+     'PA': ['src/pa/linux.S', 'src/pa/ffi.c'],
+     'PA_LINUX': ['src/pa/linux.S', 'src/pa/ffi.c'],
+     'PA_HPUX': ['src/pa/hpux32.S', 'src/pa/ffi.c'],
++    'AARCH64' : ['src/aarch64/ffi.c', 'src/aarch64/sysv.S'],
+ }
+ 
+ ffi_sources += ffi_platforms['@TARGET@']
diff --git a/meta/recipes-devtools/python/python/libffi-aarch64.patch b/meta/recipes-devtools/python/python/libffi-aarch64.patch
new file mode 100644
index 0000000..5581922
--- /dev/null
+++ b/meta/recipes-devtools/python/python/libffi-aarch64.patch
@@ -0,0 +1,1608 @@
+Add support for aarch64 for ctypes module
+
+Python have its own version of libffi used for ctypes module.
+libffi 3.0.10 contained in original source of Python-2.7.3 does not have
+support for aarch64 architecture.
+This is patch is backport support for aarch64 from libffi 3.1
+
+Upstream-Status: Backport
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+
+diff -ruN Python-2.7.3.orig/Modules/_ctypes/libffi/configure.ac Python-2.7.3/Modules/_ctypes/libffi/configure.ac
+--- Python-2.7.3.orig/Modules/_ctypes/libffi/configure.ac	2015-02-27 23:15:16.118393178 +0100
++++ Python-2.7.3/Modules/_ctypes/libffi/configure.ac	2015-02-27 23:51:03.351556903 +0100
+@@ -44,6 +44,10 @@
+ 
+ TARGETDIR="unknown"
+ case "$host" in
++  aarch64*-*-*)
++	TARGET=AARCH64; TARGETDIR=aarch64
++	;;
++
+   alpha*-*-*)
+ 	TARGET=ALPHA; TARGETDIR=alpha;
+ 	# Support 128-bit long double, changeable via command-line switch.
+@@ -195,6 +199,7 @@
+ AM_CONDITIONAL(POWERPC_AIX, test x$TARGET = xPOWERPC_AIX)
+ AM_CONDITIONAL(POWERPC_DARWIN, test x$TARGET = xPOWERPC_DARWIN)
+ AM_CONDITIONAL(POWERPC_FREEBSD, test x$TARGET = xPOWERPC_FREEBSD)
++AM_CONDITIONAL(AARCH64, test x$TARGET = xAARCH64)
+ AM_CONDITIONAL(ARM, test x$TARGET = xARM)
+ AM_CONDITIONAL(AVR32, test x$TARGET = xAVR32)
+ AM_CONDITIONAL(LIBFFI_CRIS, test x$TARGET = xLIBFFI_CRIS)
+diff -ruN Python-2.7.3.orig/Modules/_ctypes/libffi/src/aarch64/ffi.c Python-2.7.3/Modules/_ctypes/libffi/src/aarch64/ffi.c
+--- Python-2.7.3.orig/Modules/_ctypes/libffi/src/aarch64/ffi.c	1970-01-01 01:00:00.000000000 +0100
++++ Python-2.7.3/Modules/_ctypes/libffi/src/aarch64/ffi.c	2014-04-25 19:45:13.000000000 +0200
+@@ -0,0 +1,1168 @@
++/* Copyright (c) 2009, 2010, 2011, 2012 ARM Ltd.
++
++Permission is hereby granted, free of charge, to any person obtaining
++a copy of this software and associated documentation files (the
++``Software''), to deal in the Software without restriction, including
++without limitation the rights to use, copy, modify, merge, publish,
++distribute, sublicense, and/or sell copies of the Software, and to
++permit persons to whom the Software is furnished to do so, subject to
++the following conditions:
++
++The above copyright notice and this permission notice shall be
++included in all copies or substantial portions of the Software.
++
++THE SOFTWARE IS PROVIDED ``AS IS'', WITHOUT WARRANTY OF ANY KIND,
++EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
++
++#include <stdio.h>
++
++#include <ffi.h>
++#include <ffi_common.h>
++
++#include <stdlib.h>
++
++/* Stack alignment requirement in bytes */
++#if defined (__APPLE__)
++#define AARCH64_STACK_ALIGN 1
++#else
++#define AARCH64_STACK_ALIGN 16
++#endif
++
++#define N_X_ARG_REG 8
++#define N_V_ARG_REG 8
++
++#define AARCH64_FFI_WITH_V (1 << AARCH64_FFI_WITH_V_BIT)
++
++union _d
++{
++  UINT64 d;
++  UINT32 s[2];
++};
++
++struct call_context
++{
++  UINT64 x [AARCH64_N_XREG];
++  struct
++  {
++    union _d d[2];
++  } v [AARCH64_N_VREG];
++};
++
++#if defined (__clang__) && defined (__APPLE__)
++extern void
++sys_icache_invalidate (void *start, size_t len);
++#endif
++
++static inline void
++ffi_clear_cache (void *start, void *end)
++{
++#if defined (__clang__) && defined (__APPLE__)
++	sys_icache_invalidate (start, (char *)end - (char *)start);
++#elif defined (__GNUC__)
++	__builtin___clear_cache (start, end);
++#else
++#error "Missing builtin to flush instruction cache"
++#endif
++}
++
++static void *
++get_x_addr (struct call_context *context, unsigned n)
++{
++  return &context->x[n];
++}
++
++static void *
++get_s_addr (struct call_context *context, unsigned n)
++{
++#if defined __AARCH64EB__
++  return &context->v[n].d[1].s[1];
++#else
++  return &context->v[n].d[0].s[0];
++#endif
++}
++
++static void *
++get_d_addr (struct call_context *context, unsigned n)
++{
++#if defined __AARCH64EB__
++  return &context->v[n].d[1];
++#else
++  return &context->v[n].d[0];
++#endif
++}
++
++static void *
++get_v_addr (struct call_context *context, unsigned n)
++{
++  return &context->v[n];
++}
++
++/* Return the memory location at which a basic type would reside
++   were it to have been stored in register n.  */
++
++static void *
++get_basic_type_addr (unsigned short type, struct call_context *context,
++		     unsigned n)
++{
++  switch (type)
++    {
++    case FFI_TYPE_FLOAT:
++      return get_s_addr (context, n);
++    case FFI_TYPE_DOUBLE:
++      return get_d_addr (context, n);
++#if FFI_TYPE_DOUBLE != FFI_TYPE_LONGDOUBLE
++    case FFI_TYPE_LONGDOUBLE:
++      return get_v_addr (context, n);
++#endif
++    case FFI_TYPE_UINT8:
++    case FFI_TYPE_SINT8:
++    case FFI_TYPE_UINT16:
++    case FFI_TYPE_SINT16:
++    case FFI_TYPE_UINT32:
++    case FFI_TYPE_SINT32:
++    case FFI_TYPE_INT:
++    case FFI_TYPE_POINTER:
++    case FFI_TYPE_UINT64:
++    case FFI_TYPE_SINT64:
++      return get_x_addr (context, n);
++    case FFI_TYPE_VOID:
++      return NULL;
++    default:
++      FFI_ASSERT (0);
++      return NULL;
++    }
++}
++
++/* Return the alignment width for each of the basic types.  */
++
++static size_t
++get_basic_type_alignment (unsigned short type)
++{
++  switch (type)
++    {
++    case FFI_TYPE_FLOAT:
++    case FFI_TYPE_DOUBLE:
++      return sizeof (UINT64);
++#if FFI_TYPE_DOUBLE != FFI_TYPE_LONGDOUBLE
++    case FFI_TYPE_LONGDOUBLE:
++      return sizeof (long double);
++#endif
++    case FFI_TYPE_UINT8:
++    case FFI_TYPE_SINT8:
++#if defined (__APPLE__)
++	  return sizeof (UINT8);
++#endif
++    case FFI_TYPE_UINT16:
++    case FFI_TYPE_SINT16:
++#if defined (__APPLE__)
++	  return sizeof (UINT16);
++#endif
++    case FFI_TYPE_UINT32:
++    case FFI_TYPE_INT:
++    case FFI_TYPE_SINT32:
++#if defined (__APPLE__)
++	  return sizeof (UINT32);
++#endif
++    case FFI_TYPE_POINTER:
++    case FFI_TYPE_UINT64:
++    case FFI_TYPE_SINT64:
++      return sizeof (UINT64);
++
++    default:
++      FFI_ASSERT (0);
++      return 0;
++    }
++}
++
++/* Return the size in bytes for each of the basic types.  */
++
++static size_t
++get_basic_type_size (unsigned short type)
++{
++  switch (type)
++    {
++    case FFI_TYPE_FLOAT:
++      return sizeof (UINT32);
++    case FFI_TYPE_DOUBLE:
++      return sizeof (UINT64);
++#if FFI_TYPE_DOUBLE != FFI_TYPE_LONGDOUBLE
++    case FFI_TYPE_LONGDOUBLE:
++      return sizeof (long double);
++#endif
++    case FFI_TYPE_UINT8:
++      return sizeof (UINT8);
++    case FFI_TYPE_SINT8:
++      return sizeof (SINT8);
++    case FFI_TYPE_UINT16:
++      return sizeof (UINT16);
++    case FFI_TYPE_SINT16:
++      return sizeof (SINT16);
++    case FFI_TYPE_UINT32:
++      return sizeof (UINT32);
++    case FFI_TYPE_INT:
++    case FFI_TYPE_SINT32:
++      return sizeof (SINT32);
++    case FFI_TYPE_POINTER:
++    case FFI_TYPE_UINT64:
++      return sizeof (UINT64);
++    case FFI_TYPE_SINT64:
++      return sizeof (SINT64);
++
++    default:
++      FFI_ASSERT (0);
++      return 0;
++    }
++}
++
++extern void
++ffi_call_SYSV (unsigned (*)(struct call_context *context, unsigned char *,
++			    extended_cif *),
++               struct call_context *context,
++               extended_cif *,
++               size_t,
++               void (*fn)(void));
++
++extern void
++ffi_closure_SYSV (ffi_closure *);
++
++/* Test for an FFI floating point representation.  */
++
++static unsigned
++is_floating_type (unsigned short type)
++{
++  return (type == FFI_TYPE_FLOAT || type == FFI_TYPE_DOUBLE
++	  || type == FFI_TYPE_LONGDOUBLE);
++}
++
++/* Test for a homogeneous structure.  */
++
++static unsigned short
++get_homogeneous_type (ffi_type *ty)
++{
++  if (ty->type == FFI_TYPE_STRUCT && ty->elements)
++    {
++      unsigned i;
++      unsigned short candidate_type
++	= get_homogeneous_type (ty->elements[0]);
++      for (i =1; ty->elements[i]; i++)
++	{
++	  unsigned short iteration_type = 0;
++	  /* If we have a nested struct, we must find its homogeneous type.
++	     If that fits with our candidate type, we are still
++	     homogeneous.  */
++	  if (ty->elements[i]->type == FFI_TYPE_STRUCT
++	      && ty->elements[i]->elements)
++	    {
++	      iteration_type = get_homogeneous_type (ty->elements[i]);
++	    }
++	  else
++	    {
++	      iteration_type = ty->elements[i]->type;
++	    }
++
++	  /* If we are not homogeneous, return FFI_TYPE_STRUCT.  */
++	  if (candidate_type != iteration_type)
++	    return FFI_TYPE_STRUCT;
++	}
++      return candidate_type;
++    }
++
++  /* Base case, we have no more levels of nesting, so we
++     are a basic type, and so, trivially homogeneous in that type.  */
++  return ty->type;
++}
++
++/* Determine the number of elements within a STRUCT.
++
++   Note, we must handle nested structs.
++
++   If ty is not a STRUCT this function will return 0.  */
++
++static unsigned
++element_count (ffi_type *ty)
++{
++  if (ty->type == FFI_TYPE_STRUCT && ty->elements)
++    {
++      unsigned n;
++      unsigned elems = 0;
++      for (n = 0; ty->elements[n]; n++)
++	{
++	  if (ty->elements[n]->type == FFI_TYPE_STRUCT
++	      && ty->elements[n]->elements)
++	    elems += element_count (ty->elements[n]);
++	  else
++	    elems++;
++	}
++      return elems;
++    }
++  return 0;
++}
++
++/* Test for a homogeneous floating point aggregate.
++
++   A homogeneous floating point aggregate is a homogeneous aggregate of
++   a half- single- or double- precision floating point type with one
++   to four elements.  Note that this includes nested structs of the
++   basic type.  */
++
++static int
++is_hfa (ffi_type *ty)
++{
++  if (ty->type == FFI_TYPE_STRUCT
++      && ty->elements[0]
++      && is_floating_type (get_homogeneous_type (ty)))
++    {
++      unsigned n = element_count (ty);
++      return n >= 1 && n <= 4;
++    }
++  return 0;
++}
++
++/* Test if an ffi_type is a candidate for passing in a register.
++
++   This test does not check that sufficient registers of the
++   appropriate class are actually available, merely that IFF
++   sufficient registers are available then the argument will be passed
++   in register(s).
++
++   Note that an ffi_type that is deemed to be a register candidate
++   will always be returned in registers.
++
++   Returns 1 if a register candidate else 0.  */
++
++static int
++is_register_candidate (ffi_type *ty)
++{
++  switch (ty->type)
++    {
++    case FFI_TYPE_VOID:
++    case FFI_TYPE_FLOAT:
++    case FFI_TYPE_DOUBLE:
++#if FFI_TYPE_DOUBLE != FFI_TYPE_LONGDOUBLE
++    case FFI_TYPE_LONGDOUBLE:
++#endif
++    case FFI_TYPE_UINT8:
++    case FFI_TYPE_UINT16:
++    case FFI_TYPE_UINT32:
++    case FFI_TYPE_UINT64:
++    case FFI_TYPE_POINTER:
++    case FFI_TYPE_SINT8:
++    case FFI_TYPE_SINT16:
++    case FFI_TYPE_SINT32:
++    case FFI_TYPE_INT:
++    case FFI_TYPE_SINT64:
++      return 1;
++
++    case FFI_TYPE_STRUCT:
++      if (is_hfa (ty))
++        {
++          return 1;
++        }
++      else if (ty->size > 16)
++        {
++          /* Too large. Will be replaced with a pointer to memory. The
++             pointer MAY be passed in a register, but the value will
++             not. This test specifically fails since the argument will
++             never be passed by value in registers. */
++          return 0;
++        }
++      else
++        {
++          /* Might be passed in registers depending on the number of
++             registers required. */
++          return (ty->size + 7) / 8 < N_X_ARG_REG;
++        }
++      break;
++
++    default:
++      FFI_ASSERT (0);
++      break;
++    }
++
++  return 0;
++}
++
++/* Test if an ffi_type argument or result is a candidate for a vector
++   register.  */
++
++static int
++is_v_register_candidate (ffi_type *ty)
++{
++  return is_floating_type (ty->type)
++	   || (ty->type == FFI_TYPE_STRUCT && is_hfa (ty));
++}
++
++/* Representation of the procedure call argument marshalling
++   state.
++
++   The terse state variable names match the names used in the AARCH64
++   PCS. */
++
++struct arg_state
++{
++  unsigned ngrn;                /* Next general-purpose register number. */
++  unsigned nsrn;                /* Next vector register number. */
++  size_t nsaa;                  /* Next stack offset. */
++
++#if defined (__APPLE__)
++  unsigned allocating_variadic;
++#endif
++};
++
++/* Initialize a procedure call argument marshalling state.  */
++static void
++arg_init (struct arg_state *state, size_t call_frame_size)
++{
++  state->ngrn = 0;
++  state->nsrn = 0;
++  state->nsaa = 0;
++
++#if defined (__APPLE__)
++  state->allocating_variadic = 0;
++#endif
++}
++
++/* Return the number of available consecutive core argument
++   registers.  */
++
++static unsigned
++available_x (struct arg_state *state)
++{
++  return N_X_ARG_REG - state->ngrn;
++}
++
++/* Return the number of available consecutive vector argument
++   registers.  */
++
++static unsigned
++available_v (struct arg_state *state)
++{
++  return N_V_ARG_REG - state->nsrn;
++}
++
++static void *
++allocate_to_x (struct call_context *context, struct arg_state *state)
++{
++  FFI_ASSERT (state->ngrn < N_X_ARG_REG);
++  return get_x_addr (context, (state->ngrn)++);
++}
++
++static void *
++allocate_to_s (struct call_context *context, struct arg_state *state)
++{
++  FFI_ASSERT (state->nsrn < N_V_ARG_REG);
++  return get_s_addr (context, (state->nsrn)++);
++}
++
++static void *
++allocate_to_d (struct call_context *context, struct arg_state *state)
++{
++  FFI_ASSERT (state->nsrn < N_V_ARG_REG);
++  return get_d_addr (context, (state->nsrn)++);
++}
++
++static void *
++allocate_to_v (struct call_context *context, struct arg_state *state)
++{
++  FFI_ASSERT (state->nsrn < N_V_ARG_REG);
++  return get_v_addr (context, (state->nsrn)++);
++}
++
++/* Allocate an aligned slot on the stack and return a pointer to it.  */
++static void *
++allocate_to_stack (struct arg_state *state, void *stack, size_t alignment,
++		   size_t size)
++{
++  void *allocation;
++
++  /* Round up the NSAA to the larger of 8 or the natural
++     alignment of the argument's type.  */
++  state->nsaa = ALIGN (state->nsaa, alignment);
++  state->nsaa = ALIGN (state->nsaa, alignment);
++#if defined (__APPLE__)
++  if (state->allocating_variadic)
++    state->nsaa = ALIGN (state->nsaa, 8);
++#else
++  state->nsaa = ALIGN (state->nsaa, 8);
++#endif
++
++  allocation = stack + state->nsaa;
++
++  state->nsaa += size;
++  return allocation;
++}
++
++static void
++copy_basic_type (void *dest, void *source, unsigned short type)
++{
++  /* This is necessary to ensure that basic types are copied
++     sign extended to 64-bits as libffi expects.  */
++  switch (type)
++    {
++    case FFI_TYPE_FLOAT:
++      *(float *) dest = *(float *) source;
++      break;
++    case FFI_TYPE_DOUBLE:
++      *(double *) dest = *(double *) source;
++      break;
++#if FFI_TYPE_DOUBLE != FFI_TYPE_LONGDOUBLE
++    case FFI_TYPE_LONGDOUBLE:
++      *(long double *) dest = *(long double *) source;
++      break;
++#endif
++    case FFI_TYPE_UINT8:
++      *(ffi_arg *) dest = *(UINT8 *) source;
++      break;
++    case FFI_TYPE_SINT8:
++      *(ffi_sarg *) dest = *(SINT8 *) source;
++      break;
++    case FFI_TYPE_UINT16:
++      *(ffi_arg *) dest = *(UINT16 *) source;
++      break;
++    case FFI_TYPE_SINT16:
++      *(ffi_sarg *) dest = *(SINT16 *) source;
++      break;
++    case FFI_TYPE_UINT32:
++      *(ffi_arg *) dest = *(UINT32 *) source;
++      break;
++    case FFI_TYPE_INT:
++    case FFI_TYPE_SINT32:
++      *(ffi_sarg *) dest = *(SINT32 *) source;
++      break;
++    case FFI_TYPE_POINTER:
++    case FFI_TYPE_UINT64:
++      *(ffi_arg *) dest = *(UINT64 *) source;
++      break;
++    case FFI_TYPE_SINT64:
++      *(ffi_sarg *) dest = *(SINT64 *) source;
++      break;
++    case FFI_TYPE_VOID:
++      break;
++
++    default:
++      FFI_ASSERT (0);
++    }
++}
++
++static void
++copy_hfa_to_reg_or_stack (void *memory,
++			  ffi_type *ty,
++			  struct call_context *context,
++			  unsigned char *stack,
++			  struct arg_state *state)
++{
++  unsigned elems = element_count (ty);
++  if (available_v (state) < elems)
++    {
++      /* There are insufficient V registers. Further V register allocations
++	 are prevented, the NSAA is adjusted (by allocate_to_stack ())
++	 and the argument is copied to memory at the adjusted NSAA.  */
++      state->nsrn = N_V_ARG_REG;
++      memcpy (allocate_to_stack (state, stack, ty->alignment, ty->size),
++	      memory,
++	      ty->size);
++    }
++  else
++    {
++      int i;
++      unsigned short type = get_homogeneous_type (ty);
++      for (i = 0; i < elems; i++)
++	{
++	  void *reg = allocate_to_v (context, state);
++	  copy_basic_type (reg, memory, type);
++	  memory += get_basic_type_size (type);
++	}
++    }
++}
++
++/* Either allocate an appropriate register for the argument type, or if
++   none are available, allocate a stack slot and return a pointer
++   to the allocated space.  */
++
++static void *
++allocate_to_register_or_stack (struct call_context *context,
++			       unsigned char *stack,
++			       struct arg_state *state,
++			       unsigned short type)
++{
++  size_t alignment = get_basic_type_alignment (type);
++  size_t size = alignment;
++  switch (type)
++    {
++    case FFI_TYPE_FLOAT:
++      /* This is the only case for which the allocated stack size
++	 should not match the alignment of the type.  */
++      size = sizeof (UINT32);
++      /* Fall through.  */
++    case FFI_TYPE_DOUBLE:
++      if (state->nsrn < N_V_ARG_REG)
++	return allocate_to_d (context, state);
++      state->nsrn = N_V_ARG_REG;
++      break;
++#if FFI_TYPE_DOUBLE != FFI_TYPE_LONGDOUBLE
++    case FFI_TYPE_LONGDOUBLE:
++      if (state->nsrn < N_V_ARG_REG)
++	return allocate_to_v (context, state);
++      state->nsrn = N_V_ARG_REG;
++      break;
++#endif
++    case FFI_TYPE_UINT8:
++    case FFI_TYPE_SINT8:
++    case FFI_TYPE_UINT16:
++    case FFI_TYPE_SINT16:
++    case FFI_TYPE_UINT32:
++    case FFI_TYPE_SINT32:
++    case FFI_TYPE_INT:
++    case FFI_TYPE_POINTER:
++    case FFI_TYPE_UINT64:
++    case FFI_TYPE_SINT64:
++      if (state->ngrn < N_X_ARG_REG)
++	return allocate_to_x (context, state);
++      state->ngrn = N_X_ARG_REG;
++      break;
++    default:
++      FFI_ASSERT (0);
++    }
++
++    return allocate_to_stack (state, stack, alignment, size);
++}
++
++/* Copy a value to an appropriate register, or if none are
++   available, to the stack.  */
++
++static void
++copy_to_register_or_stack (struct call_context *context,
++			   unsigned char *stack,
++			   struct arg_state *state,
++			   void *value,
++			   unsigned short type)
++{
++  copy_basic_type (
++	  allocate_to_register_or_stack (context, stack, state, type),
++	  value,
++	  type);
++}
++
++/* Marshall the arguments from FFI representation to procedure call
++   context and stack.  */
++
++static unsigned
++aarch64_prep_args (struct call_context *context, unsigned char *stack,
++		   extended_cif *ecif)
++{
++  int i;
++  struct arg_state state;
++
++  arg_init (&state, ALIGN(ecif->cif->bytes, 16));
++
++  for (i = 0; i < ecif->cif->nargs; i++)
++    {
++      ffi_type *ty = ecif->cif->arg_types[i];
++      switch (ty->type)
++	{
++	case FFI_TYPE_VOID:
++	  FFI_ASSERT (0);
++	  break;
++
++	/* If the argument is a basic type the argument is allocated to an
++	   appropriate register, or if none are available, to the stack.  */
++	case FFI_TYPE_FLOAT:
++	case FFI_TYPE_DOUBLE:
++#if FFI_TYPE_DOUBLE != FFI_TYPE_LONGDOUBLE
++	case FFI_TYPE_LONGDOUBLE:
++#endif
++	case FFI_TYPE_UINT8:
++	case FFI_TYPE_SINT8:
++	case FFI_TYPE_UINT16:
++	case FFI_TYPE_SINT16:
++	case FFI_TYPE_UINT32:
++	case FFI_TYPE_INT:
++	case FFI_TYPE_SINT32:
++	case FFI_TYPE_POINTER:
++	case FFI_TYPE_UINT64:
++	case FFI_TYPE_SINT64:
++	  copy_to_register_or_stack (context, stack, &state,
++				     ecif->avalue[i], ty->type);
++	  break;
++
++	case FFI_TYPE_STRUCT:
++	  if (is_hfa (ty))
++	    {
++	      copy_hfa_to_reg_or_stack (ecif->avalue[i], ty, context,
++					stack, &state);
++	    }
++	  else if (ty->size > 16)
++	    {
++	      /* If the argument is a composite type that is larger than 16
++		 bytes, then the argument has been copied to memory, and
++		 the argument is replaced by a pointer to the copy.  */
++
++	      copy_to_register_or_stack (context, stack, &state,
++					 &(ecif->avalue[i]), FFI_TYPE_POINTER);
++	    }
++	  else if (available_x (&state) >= (ty->size + 7) / 8)
++	    {
++	      /* If the argument is a composite type and the size in
++		 double-words is not more than the number of available
++		 X registers, then the argument is copied into consecutive
++		 X registers.  */
++	      int j;
++	      for (j = 0; j < (ty->size + 7) / 8; j++)
++		{
++		  memcpy (allocate_to_x (context, &state),
++			  &(((UINT64 *) ecif->avalue[i])[j]),
++			  sizeof (UINT64));
++		}
++	    }
++	  else
++	    {
++	      /* Otherwise, there are insufficient X registers. Further X
++		 register allocations are prevented, the NSAA is adjusted
++		 (by allocate_to_stack ()) and the argument is copied to
++		 memory at the adjusted NSAA.  */
++	      state.ngrn = N_X_ARG_REG;
++
++	      memcpy (allocate_to_stack (&state, stack, ty->alignment,
++					 ty->size), ecif->avalue + i, ty->size);
++	    }
++	  break;
++
++	default:
++	  FFI_ASSERT (0);
++	  break;
++	}
++
++#if defined (__APPLE__)
++      if (i + 1 == ecif->cif->aarch64_nfixedargs)
++	{
++	  state.ngrn = N_X_ARG_REG;
++	  state.nsrn = N_V_ARG_REG;
++
++	  state.allocating_variadic = 1;
++	}
++#endif
++    }
++
++  return ecif->cif->aarch64_flags;
++}
++
++ffi_status
++ffi_prep_cif_machdep (ffi_cif *cif)
++{
++  /* Round the stack up to a multiple of the stack alignment requirement. */
++  cif->bytes =
++    (cif->bytes + (AARCH64_STACK_ALIGN - 1)) & ~ (AARCH64_STACK_ALIGN - 1);
++
++  /* Initialize our flags. We are interested if this CIF will touch a
++     vector register, if so we will enable context save and load to
++     those registers, otherwise not. This is intended to be friendly
++     to lazy float context switching in the kernel.  */
++  cif->aarch64_flags = 0;
++
++  if (is_v_register_candidate (cif->rtype))
++    {
++      cif->aarch64_flags |= AARCH64_FFI_WITH_V;
++    }
++  else
++    {
++      int i;
++      for (i = 0; i < cif->nargs; i++)
++        if (is_v_register_candidate (cif->arg_types[i]))
++          {
++            cif->aarch64_flags |= AARCH64_FFI_WITH_V;
++            break;
++          }
++    }
++
++  return FFI_OK;
++}
++
++#if defined (__APPLE__)
++
++/* Perform Apple-specific cif processing for variadic calls */
++ffi_status ffi_prep_cif_machdep_var(ffi_cif *cif,
++				    unsigned int nfixedargs,
++				    unsigned int ntotalargs)
++{
++  cif->aarch64_nfixedargs = nfixedargs;
++
++  return ffi_prep_cif_machdep(cif);
++}
++
++#endif
++
++/* Call a function with the provided arguments and capture the return
++   value.  */
++void
++ffi_call (ffi_cif *cif, void (*fn)(void), void *rvalue, void **avalue)
++{
++  extended_cif ecif;
++
++  ecif.cif = cif;
++  ecif.avalue = avalue;
++  ecif.rvalue = rvalue;
++
++  switch (cif->abi)
++    {
++    case FFI_SYSV:
++      {
++        struct call_context context;
++	size_t stack_bytes;
++
++	/* Figure out the total amount of stack space we need, the
++	   above call frame space needs to be 16 bytes aligned to
++	   ensure correct alignment of the first object inserted in
++	   that space hence the ALIGN applied to cif->bytes.*/
++	stack_bytes = ALIGN(cif->bytes, 16);
++
++	memset (&context, 0, sizeof (context));
++        if (is_register_candidate (cif->rtype))
++          {
++            ffi_call_SYSV (aarch64_prep_args, &context, &ecif, stack_bytes, fn);
++            switch (cif->rtype->type)
++              {
++              case FFI_TYPE_VOID:
++              case FFI_TYPE_FLOAT:
++              case FFI_TYPE_DOUBLE:
++#if FFI_TYPE_DOUBLE != FFI_TYPE_LONGDOUBLE
++              case FFI_TYPE_LONGDOUBLE:
++#endif
++              case FFI_TYPE_UINT8:
++              case FFI_TYPE_SINT8:
++              case FFI_TYPE_UINT16:
++              case FFI_TYPE_SINT16:
++              case FFI_TYPE_UINT32:
++              case FFI_TYPE_SINT32:
++              case FFI_TYPE_POINTER:
++              case FFI_TYPE_UINT64:
++              case FFI_TYPE_INT:
++              case FFI_TYPE_SINT64:
++		{
++		  void *addr = get_basic_type_addr (cif->rtype->type,
++						    &context, 0);
++		  copy_basic_type (rvalue, addr, cif->rtype->type);
++		  break;
++		}
++
++              case FFI_TYPE_STRUCT:
++                if (is_hfa (cif->rtype))
++		  {
++		    int j;
++		    unsigned short type = get_homogeneous_type (cif->rtype);
++		    unsigned elems = element_count (cif->rtype);
++		    for (j = 0; j < elems; j++)
++		      {
++			void *reg = get_basic_type_addr (type, &context, j);
++			copy_basic_type (rvalue, reg, type);
++			rvalue += get_basic_type_size (type);
++		      }
++		  }
++                else if ((cif->rtype->size + 7) / 8 < N_X_ARG_REG)
++                  {
++                    size_t size = ALIGN (cif->rtype->size, sizeof (UINT64));
++                    memcpy (rvalue, get_x_addr (&context, 0), size);
++                  }
++                else
++                  {
++                    FFI_ASSERT (0);
++                  }
++                break;
++
++              default:
++                FFI_ASSERT (0);
++                break;
++              }
++          }
++        else
++          {
++            memcpy (get_x_addr (&context, 8), &rvalue, sizeof (UINT64));
++            ffi_call_SYSV (aarch64_prep_args, &context, &ecif,
++			   stack_bytes, fn);
++          }
++        break;
++      }
++
++    default:
++      FFI_ASSERT (0);
++      break;
++    }
++}
++
++static unsigned char trampoline [] =
++{ 0x70, 0x00, 0x00, 0x58,	/* ldr	x16, 1f	*/
++  0x91, 0x00, 0x00, 0x10,	/* adr	x17, 2f	*/
++  0x00, 0x02, 0x1f, 0xd6	/* br	x16	*/
++};
++
++/* Build a trampoline.  */
++
++#define FFI_INIT_TRAMPOLINE(TRAMP,FUN,CTX,FLAGS)			\
++  ({unsigned char *__tramp = (unsigned char*)(TRAMP);			\
++    UINT64  __fun = (UINT64)(FUN);					\
++    UINT64  __ctx = (UINT64)(CTX);					\
++    UINT64  __flags = (UINT64)(FLAGS);					\
++    memcpy (__tramp, trampoline, sizeof (trampoline));			\
++    memcpy (__tramp + 12, &__fun, sizeof (__fun));			\
++    memcpy (__tramp + 20, &__ctx, sizeof (__ctx));			\
++    memcpy (__tramp + 28, &__flags, sizeof (__flags));			\
++    ffi_clear_cache(__tramp, __tramp + FFI_TRAMPOLINE_SIZE);		\
++  })
++
++ffi_status
++ffi_prep_closure_loc (ffi_closure* closure,
++                      ffi_cif* cif,
++                      void (*fun)(ffi_cif*,void*,void**,void*),
++                      void *user_data,
++                      void *codeloc)
++{
++  if (cif->abi != FFI_SYSV)
++    return FFI_BAD_ABI;
++
++  FFI_INIT_TRAMPOLINE (&closure->tramp[0], &ffi_closure_SYSV, codeloc,
++		       cif->aarch64_flags);
++
++  closure->cif  = cif;
++  closure->user_data = user_data;
++  closure->fun  = fun;
++
++  return FFI_OK;
++}
++
++/* Primary handler to setup and invoke a function within a closure.
++
++   A closure when invoked enters via the assembler wrapper
++   ffi_closure_SYSV(). The wrapper allocates a call context on the
++   stack, saves the interesting registers (from the perspective of
++   the calling convention) into the context then passes control to
++   ffi_closure_SYSV_inner() passing the saved context and a pointer to
++   the stack at the point ffi_closure_SYSV() was invoked.
++
++   On the return path the assembler wrapper will reload call context
++   registers.
++
++   ffi_closure_SYSV_inner() marshalls the call context into ffi value
++   descriptors, invokes the wrapped function, then marshalls the return
++   value back into the call context.  */
++
++void FFI_HIDDEN
++ffi_closure_SYSV_inner (ffi_closure *closure, struct call_context *context,
++			void *stack)
++{
++  ffi_cif *cif = closure->cif;
++  void **avalue = (void**) alloca (cif->nargs * sizeof (void*));
++  void *rvalue = NULL;
++  int i;
++  struct arg_state state;
++
++  arg_init (&state, ALIGN(cif->bytes, 16));
++
++  for (i = 0; i < cif->nargs; i++)
++    {
++      ffi_type *ty = cif->arg_types[i];
++
++      switch (ty->type)
++	{
++	case FFI_TYPE_VOID:
++	  FFI_ASSERT (0);
++	  break;
++
++	case FFI_TYPE_UINT8:
++	case FFI_TYPE_SINT8:
++	case FFI_TYPE_UINT16:
++	case FFI_TYPE_SINT16:
++	case FFI_TYPE_UINT32:
++	case FFI_TYPE_SINT32:
++	case FFI_TYPE_INT:
++	case FFI_TYPE_POINTER:
++	case FFI_TYPE_UINT64:
++	case FFI_TYPE_SINT64:
++	case  FFI_TYPE_FLOAT:
++	case  FFI_TYPE_DOUBLE:
++#if FFI_TYPE_DOUBLE != FFI_TYPE_LONGDOUBLE
++	case  FFI_TYPE_LONGDOUBLE:
++	  avalue[i] = allocate_to_register_or_stack (context, stack,
++						     &state, ty->type);
++	  break;
++#endif
++
++	case FFI_TYPE_STRUCT:
++	  if (is_hfa (ty))
++	    {
++	      unsigned n = element_count (ty);
++	      if (available_v (&state) < n)
++		{
++		  state.nsrn = N_V_ARG_REG;
++		  avalue[i] = allocate_to_stack (&state, stack, ty->alignment,
++						 ty->size);
++		}
++	      else
++		{
++		  switch (get_homogeneous_type (ty))
++		    {
++		    case FFI_TYPE_FLOAT:
++		      {
++			/* Eeek! We need a pointer to the structure,
++			   however the homogeneous float elements are
++			   being passed in individual S registers,
++			   therefore the structure is not represented as
++			   a contiguous sequence of bytes in our saved
++			   register context. We need to fake up a copy
++			   of the structure laid out in memory
++			   correctly. The fake can be tossed once the
++			   closure function has returned hence alloca()
++			   is sufficient. */
++			int j;
++			UINT32 *p = avalue[i] = alloca (ty->size);
++			for (j = 0; j < element_count (ty); j++)
++			  memcpy (&p[j],
++				  allocate_to_s (context, &state),
++				  sizeof (*p));
++			break;
++		      }
++
++		    case FFI_TYPE_DOUBLE:
++		      {
++			/* Eeek! We need a pointer to the structure,
++			   however the homogeneous float elements are
++			   being passed in individual S registers,
++			   therefore the structure is not represented as
++			   a contiguous sequence of bytes in our saved
++			   register context. We need to fake up a copy
++			   of the structure laid out in memory
++			   correctly. The fake can be tossed once the
++			   closure function has returned hence alloca()
++			   is sufficient. */
++			int j;
++			UINT64 *p = avalue[i] = alloca (ty->size);
++			for (j = 0; j < element_count (ty); j++)
++			  memcpy (&p[j],
++				  allocate_to_d (context, &state),
++				  sizeof (*p));
++			break;
++		      }
++
++#if FFI_TYPE_DOUBLE != FFI_TYPE_LONGDOUBLE
++		    case FFI_TYPE_LONGDOUBLE:
++			  memcpy (&avalue[i],
++				  allocate_to_v (context, &state),
++				  sizeof (*avalue));
++		      break;
++#endif
++
++		    default:
++		      FFI_ASSERT (0);
++		      break;
++		    }
++		}
++	    }
++	  else if (ty->size > 16)
++	    {
++	      /* Replace Composite type of size greater than 16 with a
++		 pointer.  */
++	      memcpy (&avalue[i],
++		      allocate_to_register_or_stack (context, stack,
++						     &state, FFI_TYPE_POINTER),
++		      sizeof (avalue[i]));
++	    }
++	  else if (available_x (&state) >= (ty->size + 7) / 8)
++	    {
++	      avalue[i] = get_x_addr (context, state.ngrn);
++	      state.ngrn += (ty->size + 7) / 8;
++	    }
++	  else
++	    {
++	      state.ngrn = N_X_ARG_REG;
++
++	      avalue[i] = allocate_to_stack (&state, stack, ty->alignment,
++					     ty->size);
++	    }
++	  break;
++
++	default:
++	  FFI_ASSERT (0);
++	  break;
++	}
++    }
++
++  /* Figure out where the return value will be passed, either in
++     registers or in a memory block allocated by the caller and passed
++     in x8.  */
++
++  if (is_register_candidate (cif->rtype))
++    {
++      /* Register candidates are *always* returned in registers. */
++
++      /* Allocate a scratchpad for the return value, we will let the
++         callee scrible the result into the scratch pad then move the
++         contents into the appropriate return value location for the
++         call convention.  */
++      rvalue = alloca (cif->rtype->size);
++      (closure->fun) (cif, rvalue, avalue, closure->user_data);
++
++      /* Copy the return value into the call context so that it is returned
++         as expected to our caller.  */
++      switch (cif->rtype->type)
++        {
++        case FFI_TYPE_VOID:
++          break;
++
++        case FFI_TYPE_UINT8:
++        case FFI_TYPE_UINT16:
++        case FFI_TYPE_UINT32:
++        case FFI_TYPE_POINTER:
++        case FFI_TYPE_UINT64:
++        case FFI_TYPE_SINT8:
++        case FFI_TYPE_SINT16:
++        case FFI_TYPE_INT:
++        case FFI_TYPE_SINT32:
++        case FFI_TYPE_SINT64:
++        case FFI_TYPE_FLOAT:
++        case FFI_TYPE_DOUBLE:
++#if FFI_TYPE_DOUBLE != FFI_TYPE_LONGDOUBLE
++        case FFI_TYPE_LONGDOUBLE:
++#endif
++	  {
++	    void *addr = get_basic_type_addr (cif->rtype->type, context, 0);
++	    copy_basic_type (addr, rvalue, cif->rtype->type);
++            break;
++	  }
++        case FFI_TYPE_STRUCT:
++          if (is_hfa (cif->rtype))
++	    {
++	      int j;
++	      unsigned short type = get_homogeneous_type (cif->rtype);
++	      unsigned elems = element_count (cif->rtype);
++	      for (j = 0; j < elems; j++)
++		{
++		  void *reg = get_basic_type_addr (type, context, j);
++		  copy_basic_type (reg, rvalue, type);
++		  rvalue += get_basic_type_size (type);
++		}
++	    }
++          else if ((cif->rtype->size + 7) / 8 < N_X_ARG_REG)
++            {
++              size_t size = ALIGN (cif->rtype->size, sizeof (UINT64)) ;
++              memcpy (get_x_addr (context, 0), rvalue, size);
++            }
++          else
++            {
++              FFI_ASSERT (0);
++            }
++          break;
++        default:
++          FFI_ASSERT (0);
++          break;
++        }
++    }
++  else
++    {
++      memcpy (&rvalue, get_x_addr (context, 8), sizeof (UINT64));
++      (closure->fun) (cif, rvalue, avalue, closure->user_data);
++    }
++}
++
+diff -ruN Python-2.7.3.orig/Modules/_ctypes/libffi/src/aarch64/ffitarget.h Python-2.7.3/Modules/_ctypes/libffi/src/aarch64/ffitarget.h
+--- Python-2.7.3.orig/Modules/_ctypes/libffi/src/aarch64/ffitarget.h	1970-01-01 01:00:00.000000000 +0100
++++ Python-2.7.3/Modules/_ctypes/libffi/src/aarch64/ffitarget.h	2014-04-25 19:45:13.000000000 +0200
+@@ -0,0 +1,63 @@
++/* Copyright (c) 2009, 2010, 2011, 2012 ARM Ltd.
++
++Permission is hereby granted, free of charge, to any person obtaining
++a copy of this software and associated documentation files (the
++``Software''), to deal in the Software without restriction, including
++without limitation the rights to use, copy, modify, merge, publish,
++distribute, sublicense, and/or sell copies of the Software, and to
++permit persons to whom the Software is furnished to do so, subject to
++the following conditions:
++
++The above copyright notice and this permission notice shall be
++included in all copies or substantial portions of the Software.
++
++THE SOFTWARE IS PROVIDED ``AS IS'', WITHOUT WARRANTY OF ANY KIND,
++EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
++
++#ifndef LIBFFI_TARGET_H
++#define LIBFFI_TARGET_H
++
++#ifndef LIBFFI_H
++#error "Please do not include ffitarget.h directly into your source.  Use ffi.h instead."
++#endif
++
++#ifndef LIBFFI_ASM
++typedef unsigned long ffi_arg;
++typedef signed long ffi_sarg;
++
++typedef enum ffi_abi
++  {
++    FFI_FIRST_ABI = 0,
++    FFI_SYSV,
++    FFI_LAST_ABI,
++    FFI_DEFAULT_ABI = FFI_SYSV
++  } ffi_abi;
++#endif
++
++/* ---- Definitions for closures ----------------------------------------- */
++
++#define FFI_CLOSURES 1
++#define FFI_TRAMPOLINE_SIZE 36
++#define FFI_NATIVE_RAW_API 0
++
++/* ---- Internal ---- */
++
++#if defined (__APPLE__)
++#define FFI_TARGET_SPECIFIC_VARIADIC
++#define FFI_EXTRA_CIF_FIELDS unsigned aarch64_flags; unsigned aarch64_nfixedargs
++#else
++#define FFI_EXTRA_CIF_FIELDS unsigned aarch64_flags
++#endif
++
++#define AARCH64_FFI_WITH_V_BIT 0
++
++#define AARCH64_N_XREG 32
++#define AARCH64_N_VREG 32
++#define AARCH64_CALL_CONTEXT_SIZE (AARCH64_N_XREG * 8 + AARCH64_N_VREG * 16)
++
++#endif
+diff -ruN Python-2.7.3.orig/Modules/_ctypes/libffi/src/aarch64/sysv.S Python-2.7.3/Modules/_ctypes/libffi/src/aarch64/sysv.S
+--- Python-2.7.3.orig/Modules/_ctypes/libffi/src/aarch64/sysv.S	1970-01-01 01:00:00.000000000 +0100
++++ Python-2.7.3/Modules/_ctypes/libffi/src/aarch64/sysv.S	2014-04-25 19:45:13.000000000 +0200
+@@ -0,0 +1,333 @@
++/* Copyright (c) 2009, 2010, 2011, 2012 ARM Ltd.
++
++Permission is hereby granted, free of charge, to any person obtaining
++a copy of this software and associated documentation files (the
++``Software''), to deal in the Software without restriction, including
++without limitation the rights to use, copy, modify, merge, publish,
++distribute, sublicense, and/or sell copies of the Software, and to
++permit persons to whom the Software is furnished to do so, subject to
++the following conditions:
++
++The above copyright notice and this permission notice shall be
++included in all copies or substantial portions of the Software.
++
++THE SOFTWARE IS PROVIDED ``AS IS'', WITHOUT WARRANTY OF ANY KIND,
++EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
++IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
++CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
++TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
++SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
++
++#define LIBFFI_ASM
++#include <fficonfig.h>
++#include <ffi.h>
++
++#ifdef HAVE_MACHINE_ASM_H
++#include <machine/asm.h>
++#else
++#ifdef __USER_LABEL_PREFIX__
++#define CONCAT1(a, b) CONCAT2(a, b)
++#define CONCAT2(a, b) a ## b
++
++/* Use the right prefix for global labels.  */
++#define CNAME(x) CONCAT1 (__USER_LABEL_PREFIX__, x)
++#else
++#define CNAME(x) x
++#endif
++#endif
++
++#define cfi_adjust_cfa_offset(off)	.cfi_adjust_cfa_offset off
++#define cfi_rel_offset(reg, off)	.cfi_rel_offset reg, off
++#define cfi_restore(reg)		.cfi_restore reg
++#define cfi_def_cfa_register(reg)	.cfi_def_cfa_register reg
++
++        .text
++        .globl CNAME(ffi_call_SYSV)
++#ifdef __ELF__
++        .type CNAME(ffi_call_SYSV), #function
++#endif
++#ifdef __APPLE__
++        .align 2
++#endif
++
++/* ffi_call_SYSV()
++
++   Create a stack frame, setup an argument context, call the callee
++   and extract the result.
++
++   The maximum required argument stack size is provided,
++   ffi_call_SYSV() allocates that stack space then calls the
++   prepare_fn to populate register context and stack.  The
++   argument passing registers are loaded from the register
++   context and the callee called, on return the register passing
++   register are saved back to the context.  Our caller will
++   extract the return value from the final state of the saved
++   register context.
++
++   Prototype:
++
++   extern unsigned
++   ffi_call_SYSV (void (*)(struct call_context *context, unsigned char *,
++			   extended_cif *),
++                  struct call_context *context,
++                  extended_cif *,
++                  size_t required_stack_size,
++                  void (*fn)(void));
++
++   Therefore on entry we have:
++
++   x0 prepare_fn
++   x1 &context
++   x2 &ecif
++   x3 bytes
++   x4 fn
++
++   This function uses the following stack frame layout:
++
++   ==
++                saved x30(lr)
++   x29(fp)->    saved x29(fp)
++                saved x24
++                saved x23
++                saved x22
++   sp'    ->    saved x21
++                ...
++   sp     ->    (constructed callee stack arguments)
++   ==
++
++   Voila! */
++
++#define ffi_call_SYSV_FS (8 * 4)
++
++        .cfi_startproc
++CNAME(ffi_call_SYSV):
++        stp     x29, x30, [sp, #-16]!
++	cfi_adjust_cfa_offset (16)
++        cfi_rel_offset (x29, 0)
++        cfi_rel_offset (x30, 8)
++
++        mov     x29, sp
++	cfi_def_cfa_register (x29)
++        sub     sp, sp, #ffi_call_SYSV_FS
++
++        stp     x21, x22, [sp, #0]
++        cfi_rel_offset (x21, 0 - ffi_call_SYSV_FS)
++        cfi_rel_offset (x22, 8 - ffi_call_SYSV_FS)
++
++        stp     x23, x24, [sp, #16]
++        cfi_rel_offset (x23, 16 - ffi_call_SYSV_FS)
++        cfi_rel_offset (x24, 24 - ffi_call_SYSV_FS)
++
++        mov     x21, x1
++        mov     x22, x2
++        mov     x24, x4
++
++        /* Allocate the stack space for the actual arguments, many
++           arguments will be passed in registers, but we assume
++           worst case and allocate sufficient stack for ALL of
++           the arguments.  */
++        sub     sp, sp, x3
++
++        /* unsigned (*prepare_fn) (struct call_context *context,
++				   unsigned char *stack, extended_cif *ecif);
++	 */
++        mov     x23, x0
++        mov     x0, x1
++        mov     x1, sp
++        /* x2 already in place */
++        blr     x23
++
++        /* Preserve the flags returned.  */
++        mov     x23, x0
++
++        /* Figure out if we should touch the vector registers.  */
++        tbz     x23, #AARCH64_FFI_WITH_V_BIT, 1f
++
++        /* Load the vector argument passing registers.  */
++        ldp     q0, q1, [x21, #8*32 +  0]
++        ldp     q2, q3, [x21, #8*32 + 32]
++        ldp     q4, q5, [x21, #8*32 + 64]
++        ldp     q6, q7, [x21, #8*32 + 96]
++1:
++        /* Load the core argument passing registers.  */
++        ldp     x0, x1, [x21,  #0]
++        ldp     x2, x3, [x21, #16]
++        ldp     x4, x5, [x21, #32]
++        ldp     x6, x7, [x21, #48]
++
++        /* Don't forget x8 which may be holding the address of a return buffer.
++	 */
++        ldr     x8,     [x21, #8*8]
++
++        blr     x24
++
++        /* Save the core argument passing registers.  */
++        stp     x0, x1, [x21,  #0]
++        stp     x2, x3, [x21, #16]
++        stp     x4, x5, [x21, #32]
++        stp     x6, x7, [x21, #48]
++
++        /* Note nothing useful ever comes back in x8!  */
++
++        /* Figure out if we should touch the vector registers.  */
++        tbz     x23, #AARCH64_FFI_WITH_V_BIT, 1f
++
++        /* Save the vector argument passing registers.  */
++        stp     q0, q1, [x21, #8*32 + 0]
++        stp     q2, q3, [x21, #8*32 + 32]
++        stp     q4, q5, [x21, #8*32 + 64]
++        stp     q6, q7, [x21, #8*32 + 96]
++1:
++        /* All done, unwind our stack frame.  */
++        ldp     x21, x22, [x29,  # - ffi_call_SYSV_FS]
++        cfi_restore (x21)
++        cfi_restore (x22)
++
++        ldp     x23, x24, [x29,  # - ffi_call_SYSV_FS + 16]
++        cfi_restore (x23)
++        cfi_restore (x24)
++
++        mov     sp, x29
++	cfi_def_cfa_register (sp)
++
++        ldp     x29, x30, [sp], #16
++	cfi_adjust_cfa_offset (-16)
++        cfi_restore (x29)
++        cfi_restore (x30)
++
++        ret
++
++        .cfi_endproc
++#ifdef __ELF__
++        .size CNAME(ffi_call_SYSV), .-CNAME(ffi_call_SYSV)
++#endif
++
++#define ffi_closure_SYSV_FS (8 * 2 + AARCH64_CALL_CONTEXT_SIZE)
++
++/* ffi_closure_SYSV
++
++   Closure invocation glue. This is the low level code invoked directly by
++   the closure trampoline to setup and call a closure.
++
++   On entry x17 points to a struct trampoline_data, x16 has been clobbered
++   all other registers are preserved.
++
++   We allocate a call context and save the argument passing registers,
++   then invoked the generic C ffi_closure_SYSV_inner() function to do all
++   the real work, on return we load the result passing registers back from
++   the call context.
++
++   On entry
++
++   extern void
++   ffi_closure_SYSV (struct trampoline_data *);
++
++   struct trampoline_data
++   {
++        UINT64 *ffi_closure;
++        UINT64 flags;
++   };
++
++   This function uses the following stack frame layout:
++
++   ==
++                saved x30(lr)
++   x29(fp)->    saved x29(fp)
++                saved x22
++                saved x21
++                ...
++   sp     ->    call_context
++   ==
++
++   Voila!  */
++
++        .text
++        .globl CNAME(ffi_closure_SYSV)
++#ifdef __APPLE__
++        .align 2
++#endif
++        .cfi_startproc
++CNAME(ffi_closure_SYSV):
++        stp     x29, x30, [sp, #-16]!
++	cfi_adjust_cfa_offset (16)
++        cfi_rel_offset (x29, 0)
++        cfi_rel_offset (x30, 8)
++
++        mov     x29, sp
++        cfi_def_cfa_register (x29)
++
++        sub     sp, sp, #ffi_closure_SYSV_FS
++
++        stp     x21, x22, [x29, #-16]
++        cfi_rel_offset (x21, -16)
++        cfi_rel_offset (x22, -8)
++
++        /* Load x21 with &call_context.  */
++        mov     x21, sp
++        /* Preserve our struct trampoline_data *  */
++        mov     x22, x17
++
++        /* Save the rest of the argument passing registers.  */
++        stp     x0, x1, [x21, #0]
++        stp     x2, x3, [x21, #16]
++        stp     x4, x5, [x21, #32]
++        stp     x6, x7, [x21, #48]
++        /* Don't forget we may have been given a result scratch pad address.
++	 */
++        str     x8,     [x21, #64]
++
++        /* Figure out if we should touch the vector registers.  */
++        ldr     x0, [x22, #8]
++        tbz     x0, #AARCH64_FFI_WITH_V_BIT, 1f
++
++        /* Save the argument passing vector registers.  */
++        stp     q0, q1, [x21, #8*32 + 0]
++        stp     q2, q3, [x21, #8*32 + 32]
++        stp     q4, q5, [x21, #8*32 + 64]
++        stp     q6, q7, [x21, #8*32 + 96]
++1:
++        /* Load &ffi_closure..  */
++        ldr     x0, [x22, #0]
++        mov     x1, x21
++        /* Compute the location of the stack at the point that the
++           trampoline was called.  */
++        add     x2, x29, #16
++
++        bl      CNAME(ffi_closure_SYSV_inner)
++
++        /* Figure out if we should touch the vector registers.  */
++        ldr     x0, [x22, #8]
++        tbz     x0, #AARCH64_FFI_WITH_V_BIT, 1f
++
++        /* Load the result passing vector registers.  */
++        ldp     q0, q1, [x21, #8*32 + 0]
++        ldp     q2, q3, [x21, #8*32 + 32]
++        ldp     q4, q5, [x21, #8*32 + 64]
++        ldp     q6, q7, [x21, #8*32 + 96]
++1:
++        /* Load the result passing core registers.  */
++        ldp     x0, x1, [x21,  #0]
++        ldp     x2, x3, [x21, #16]
++        ldp     x4, x5, [x21, #32]
++        ldp     x6, x7, [x21, #48]
++        /* Note nothing useful is returned in x8.  */
++
++        /* We are done, unwind our frame.  */
++        ldp     x21, x22, [x29,  #-16]
++        cfi_restore (x21)
++        cfi_restore (x22)
++
++        mov     sp, x29
++        cfi_def_cfa_register (sp)
++
++        ldp     x29, x30, [sp], #16
++	cfi_adjust_cfa_offset (-16)
++        cfi_restore (x29)
++        cfi_restore (x30)
++
++        ret
++        .cfi_endproc
++#ifdef __ELF__
++        .size CNAME(ffi_closure_SYSV), .-CNAME(ffi_closure_SYSV)
++#endif
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index cbe8d7f..de1f57f 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -40,6 +40,8 @@ SRC_URI += "\
   file://posix_close.patch \
   file://python-2.7.3-CVE-2014-7185.patch \
   file://python2.7.3-nossl3.patch \
+  file://ctypes-libffi-aarch64.patch \
+  file://libffi-aarch64.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.9.1


