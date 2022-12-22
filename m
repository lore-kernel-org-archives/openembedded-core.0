Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA6AC4167B
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 15:01:41 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.47234.1671721296161494813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Dec 2022 07:01:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2+EPfylM;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.52, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f52.google.com with SMTP id vv4so5561611ejc.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 07:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mk5swqndEkC3K6m2Pt6/n4/0ORvPYcQsLkM+iyFGxo=;
        b=2+EPfylMvdu+a8J9HcQI8EJuXW20Kl24I4fQpVqsmUamPxmG1fwIjfNhlh5k4rySaN
         yMiy5Odn6jbzUS8xr0z1sr5mKxAFUBiZfTo8AOPgMRDsIaoWnjDB8ePRnmKDAiZG/Ffu
         kLgLUb5gvEzlnaFFrBSqxscpL60p38VkwnupR1+erQlfLr+0yZRDRSuh/3FN6gg8bsqC
         TRHupST6qmHejHUz+VvdPQWe8VLi7OocvVqNSM6kFVhiCf1GLalmdlhoaD3ftTnohtGc
         yinoz8sdO/SJJRQotUH8WfZl6JHC1+PcsWARA6oIDOYsy5wk0EiiW2YAKwPUXj/ugACG
         qwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mk5swqndEkC3K6m2Pt6/n4/0ORvPYcQsLkM+iyFGxo=;
        b=v/derWOT0mn05qvmKMCHST9UuNAg5Mj3yvJYfiijZ3iCBcNuzgInjtxq4aXay4NDlb
         MpcvbtFL0IW8dpWGbPKtlb5sgfCrq1OSX1IKeGd+rKv9IM/lMH1OjQgG+U+6b+0W1kUh
         8AjPEcgYq12CHrLZ54Gk18R566mBcOZuB0SoGMODvrQriS4w3VjsT1bZz0aYpVmr5154
         xXt8x5xO8PTtWzods/zmJYJe/V3pfoEgJIPj1O+IVhgsSpczABWYSd9OY/srh7UKZvG0
         NHL5U87vPSQImT9OCpKofVvaxK0voPJteMGWI7sttZZdFr5wCyz5Cx5kk7r6nboLPoBF
         1sqQ==
X-Gm-Message-State: AFqh2kqT9mhOu9E04dFWBr8qh5pkeVZwxOgXaC8t046HiBJISwIA54kb
	viPuyLq/Pa1xogh6xbdip9ZVpplUZKh2uUaoFyFiKg==
X-Google-Smtp-Source: AMrXdXvJRjbWqvoN0Bt9CBz2A+rHK14TinQ9QKnHR90rv67P3NftcM42C3wDGCpiKiCSZpUGb08YF29u1A/syGde6jc=
X-Received: by 2002:a17:906:99c9:b0:845:bee7:e361 with SMTP id
 s9-20020a17090699c900b00845bee7e361mr106190ejn.435.1671721294216; Thu, 22 Dec
 2022 07:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20221221163216.1758961-1-vkumbhar@gmail.com>
In-Reply-To: <20221221163216.1758961-1-vkumbhar@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 22 Dec 2022 05:01:22 -1000
Message-ID: <CAOSpxdZcK_Tr9BGXPqepPL4qkUN_+bNG6=S=rj-mq3CMMA4oWA@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] go: fix CVE-2022-1962 go/parser stack
 exhaustion in all Parse* functions
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 15:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174965

On Wed, Dec 21, 2022 at 6:32 AM vkumbhar <vkumbhar@mvista.com> wrote:
>
> From: Vivek Kumbhar <vkumbhar@mvista.com>
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  meta/recipes-devtools/go/go-1.14.inc          |   1 +
>  .../go/go-1.14/CVE-2022-1962.patch            | 421 ++++++++++++++++++
>  2 files changed, 422 insertions(+)
>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-1962.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools=
/go/go-1.14.inc
> index cec37c1b09..0361bc763b 100644
> --- a/meta/recipes-devtools/go/go-1.14.inc
> +++ b/meta/recipes-devtools/go/go-1.14.inc
> @@ -49,6 +49,7 @@ SRC_URI +=3D "\
>      file://CVE-2022-24921.patch \
>      file://CVE-2022-28131.patch \
>      file://CVE-2022-28327.patch \
> +    file://CVE-2022-1962.patch \

This patch will not apply, perhaps a conflict with "golang:
CVE-2022-41715 regexp/syntax: limit memory used by parsing regexps"
which is in the latest pull request?

ERROR: go-native-1.14.15-r0 do_patch: Applying patch
'CVE-2022-1962.patch' on target directory
'/home/steve/builds/poky-contrib/build/tmp/work/x86_64-linux/go-native/1.14=
.15-r0/go'
Command Error: 'quilt --quiltrc
/home/steve/builds/poky-contrib/build/tmp/work/x86_64-linux/go-native/1.14.=
15-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch CVE-2022-1962.patch
patching file src/go/parser/interface.go
Hunk #1 succeeded at 92 (offset -5 lines).
Hunk #2 succeeded at 191 (offset -15 lines).
patching file src/go/parser/parser.go
Hunk #1 FAILED at 60.
Hunk #2 succeeded at 236 (offset 126 lines).
Hunk #3 succeeded at 366 with fuzz 1 (offset 126 lines).
Hunk #4 succeeded at 1052 with fuzz 2 (offset -89 lines).
Hunk #5 FAILED at 1555.
Hunk #6 FAILED at 1615.
Hunk #7 FAILED at 1697.
Hunk #8 succeeded at 1923 (offset -63 lines).
Hunk #9 succeeded at 2240 (offset -51 lines).
4 out of 9 hunks FAILED -- rejects in file src/go/parser/parser.go
patching file src/go/parser/parser_test.go
Hunk #1 FAILED at 10.
Hunk #2 succeeded at 569 (offset -8 lines).
1 out of 2 hunks FAILED -- rejects in file src/go/parser/parser_test.go
can't find file to patch at input line 375
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff --git a/src/go/parser/resolver.go b/src/go/parser/resolver.go
|index cf92c7e4f5..f55bdb7f17 100644
|--- a/src/go/parser/resolver.go
|+++ b/src/go/parser/resolver.go
--------------------------
No file to patch.  Skipping patch.
5 out of 5 hunks ignored
Patch CVE-2022-1962.patch does not apply (enforce with -f)

Steve

>  "
>
>  SRC_URI_append_libc-musl =3D " file://0009-ld-replace-glibc-dynamic-link=
er-with-musl.patch"
> diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-1962.patch b/meta/=
recipes-devtools/go/go-1.14/CVE-2022-1962.patch
> new file mode 100644
> index 0000000000..ceabc9057a
> --- /dev/null
> +++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-1962.patch
> @@ -0,0 +1,421 @@
> +From ba8788ebcead55e99e631c6a1157ad7b35535d11 Mon Sep 17 00:00:00 2001
> +From: Roland Shoemaker <bracewell@google.com>
> +Date: Wed, 15 Jun 2022 10:43:05 -0700
> +Subject: [PATCH] [release-branch.go1.17] go/parser: limit recursion dept=
h
> +
> +Limit nested parsing to 100,000, which prevents stack exhaustion when
> +parsing deeply nested statements, types, and expressions. Also limit
> +the scope depth to 1,000 during object resolution.
> +
> +Thanks to Juho Nurminen of Mattermost for reporting this issue.
> +
> +Fixes #53707
> +Updates #53616
> +Fixes CVE-2022-1962
> +
> +Change-Id: I4d7b86c1d75d0bf3c7af1fdea91582aa74272c64
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private=
/+/1491025
> +Reviewed-by: Russ Cox <rsc@google.com>
> +Reviewed-by: Damien Neil <dneil@google.com>
> +(cherry picked from commit 6a856f08d58e4b6705c0c337d461c540c1235c83)
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/417070
> +Reviewed-by: Heschi Kreinick <heschi@google.com>
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +Run-TryBot: Michael Knyszek <mknyszek@google.com>
> +
> +Upstream-Status: Backport [https://github.com/golang/go/commit/ba8788ebc=
ead55e99e631c6a1157ad7b35535d11]
> +CVE: CVE-2022-1962
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + src/go/parser/interface.go   |  10 ++-
> + src/go/parser/parser.go      |  54 ++++++++++-
> + src/go/parser/parser_test.go | 169 +++++++++++++++++++++++++++++++++++
> + src/go/parser/resolver.go    |   9 ++
> + 4 files changed, 236 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/go/parser/interface.go b/src/go/parser/interface.go
> +index 85486d2f4b..eae429e6ef 100644
> +--- a/src/go/parser/interface.go
> ++++ b/src/go/parser/interface.go
> +@@ -97,8 +97,11 @@ func ParseFile(fset *token.FileSet, filename string, =
src interface{}, mode Mode)
> +       defer func() {
> +               if e :=3D recover(); e !=3D nil {
> +                       // resume same panic if it's not a bailout
> +-                      if _, ok :=3D e.(bailout); !ok {
> ++                      bail, ok :=3D e.(bailout)
> ++                      if !ok {
> +                               panic(e)
> ++                      } else if bail.msg !=3D "" {
> ++                              p.errors.Add(p.file.Position(bail.pos), b=
ail.msg)
> +                       }
> +               }
> +
> +@@ -203,8 +206,11 @@ func ParseExprFrom(fset *token.FileSet, filename st=
ring, src interface{}, mode M
> +       defer func() {
> +               if e :=3D recover(); e !=3D nil {
> +                       // resume same panic if it's not a bailout
> +-                      if _, ok :=3D e.(bailout); !ok {
> ++                      bail, ok :=3D e.(bailout)
> ++                      if !ok {
> +                               panic(e)
> ++                      } else if bail.msg !=3D "" {
> ++                              p.errors.Add(p.file.Position(bail.pos), b=
ail.msg)
> +                       }
> +               }
> +               p.errors.Sort()
> +diff --git a/src/go/parser/parser.go b/src/go/parser/parser.go
> +index f10c8650af..2c42b9f8cc 100644
> +--- a/src/go/parser/parser.go
> ++++ b/src/go/parser/parser.go
> +@@ -60,6 +60,10 @@ type parser struct {
> +       inRhs   bool // if set, the parser is parsing a rhs expression
> +
> +       imports []*ast.ImportSpec // list of imports
> ++
> ++      // nestLev is used to track and limit the recursion depth
> ++      // during parsing.
> ++      nestLev int
> + }
> +
> + func (p *parser) init(fset *token.FileSet, filename string, src []byte,=
 mode Mode) {
> +@@ -110,6 +114,24 @@ func un(p *parser) {
> +       p.printTrace(")")
> + }
> +
> ++// maxNestLev is the deepest we're willing to recurse during parsing
> ++const maxNestLev int =3D 1e5
> ++
> ++func incNestLev(p *parser) *parser {
> ++      p.nestLev++
> ++      if p.nestLev > maxNestLev {
> ++              p.error(p.pos, "exceeded max nesting depth")
> ++              panic(bailout{})
> ++      }
> ++      return p
> ++}
> ++
> ++// decNestLev is used to track nesting depth during parsing to prevent =
stack exhaustion.
> ++// It is used along with incNestLev in a similar fashion to how un and =
trace are used.
> ++func decNestLev(p *parser) {
> ++      p.nestLev--
> ++}
> ++
> + // Advance to the next token.
> + func (p *parser) next0() {
> +       // Because of one-token look-ahead, print the previous token
> +@@ -222,8 +244,12 @@ func (p *parser) next() {
> +       }
> + }
> +
> +-// A bailout panic is raised to indicate early termination.
> +-type bailout struct{}
> ++// A bailout panic is raised to indicate early termination. pos and msg=
 are
> ++// only populated when bailing out of object resolution.
> ++type bailout struct {
> ++      pos token.Pos
> ++      msg string
> ++}
> +
> + func (p *parser) error(pos token.Pos, msg string) {
> +       if p.trace {
> +@@ -1119,6 +1145,8 @@ func (p *parser) parseTypeInstance(typ ast.Expr) a=
st.Expr {
> + }
> +
> + func (p *parser) tryIdentOrType() ast.Expr {
> ++      defer decNestLev(incNestLev(p))
> ++
> +       switch p.tok {
> +       case token.IDENT:
> +               typ :=3D p.parseTypeName(nil)
> +@@ -1531,7 +1559,13 @@ func (p *parser) parsePrimaryExpr() (x ast.Expr) =
{
> +       }
> +
> +       x =3D p.parseOperand()
> +-      for {
> ++      // We track the nesting here rather than at the entry for the fun=
ction,
> ++      // since it can iteratively produce a nested output, and we want =
to
> ++      // limit how deep a structure we generate.
> ++      var n int
> ++      defer func() { p.nestLev -=3D n }()
> ++      for n =3D 1; ; n++ {
> ++              incNestLev(p)
> +               switch p.tok {
> +               case token.PERIOD:
> +                       p.next()
> +@@ -1591,6 +1625,8 @@ func (p *parser) parsePrimaryExpr() (x ast.Expr) {
> + }
> +
> + func (p *parser) parseUnaryExpr() ast.Expr {
> ++      defer decNestLev(incNestLev(p))
> ++
> +       if p.trace {
> +               defer un(trace(p, "UnaryExpr"))
> +       }
> +@@ -1673,7 +1709,13 @@ func (p *parser) parseBinaryExpr(prec1 int) ast.E=
xpr {
> +       }
> +
> +       x :=3D p.parseUnaryExpr()
> +-      for {
> ++      // We track the nesting here rather than at the entry for the fun=
ction,
> ++      // since it can iteratively produce a nested output, and we want =
to
> ++      // limit how deep a structure we generate.
> ++      var n int
> ++      defer func() { p.nestLev -=3D n }()
> ++      for n =3D 1; ; n++ {
> ++              incNestLev(p)
> +               op, oprec :=3D p.tokPrec()
> +               if oprec < prec1 {
> +                       return x
> +@@ -1962,6 +2004,8 @@ func (p *parser) parseIfHeader() (init ast.Stmt, c=
ond ast.Expr) {
> + }
> +
> + func (p *parser) parseIfStmt() *ast.IfStmt {
> ++      defer decNestLev(incNestLev(p))
> ++
> +       if p.trace {
> +               defer un(trace(p, "IfStmt"))
> +       }
> +@@ -2265,6 +2309,8 @@ func (p *parser) parseForStmt() ast.Stmt {
> + }
> +
> + func (p *parser) parseStmt() (s ast.Stmt) {
> ++      defer decNestLev(incNestLev(p))
> ++
> +       if p.trace {
> +               defer un(trace(p, "Statement"))
> +       }
> +diff --git a/src/go/parser/parser_test.go b/src/go/parser/parser_test.go
> +index a4f882d368..1a46c87866 100644
> +--- a/src/go/parser/parser_test.go
> ++++ b/src/go/parser/parser_test.go
> +@@ -10,6 +10,7 @@ import (
> +       "go/ast"
> +       "go/token"
> +       "io/fs"
> ++      "runtime"
> +       "strings"
> +       "testing"
> + )
> +@@ -577,3 +578,171 @@ type x int // comment
> +               t.Errorf("got %q, want %q", comment, "// comment")
> +       }
> + }
> ++
> ++var parseDepthTests =3D []struct {
> ++      name   string
> ++      format string
> ++      // multipler is used when a single statement may result in more t=
han one
> ++      // change in the depth level, for instance "1+(..." produces a Bi=
naryExpr
> ++      // followed by a UnaryExpr, which increments the depth twice. The=
 test
> ++      // case comment explains which nodes are triggering the multiple =
depth
> ++      // changes.
> ++      parseMultiplier int
> ++      // scope is true if we should also test the statement for the res=
olver scope
> ++      // depth limit.
> ++      scope bool
> ++      // scopeMultiplier does the same as parseMultiplier, but for the =
scope
> ++      // depths.
> ++      scopeMultiplier int
> ++}{
> ++      // The format expands the part inside =C2=AB =C2=BB many times.
> ++      // A second set of brackets nested inside the first stops the rep=
etition,
> ++      // so that for example =C2=AB(=C2=AB1=C2=BB)=C2=BB expands to (((=
...((((1))))...))).
> ++      {name: "array", format: "package main; var x =C2=AB[1]=C2=BBint"}=
,
> ++      {name: "slice", format: "package main; var x =C2=AB[]=C2=BBint"},
> ++      {name: "struct", format: "package main; var x =C2=ABstruct { X =
=C2=ABint=C2=BB }=C2=BB", scope: true},
> ++      {name: "pointer", format: "package main; var x =C2=AB*=C2=BBint"}=
,
> ++      {name: "func", format: "package main; var x =C2=ABfunc()=C2=BBint=
", scope: true},
> ++      {name: "chan", format: "package main; var x =C2=ABchan =C2=BBint"=
},
> ++      {name: "chan2", format: "package main; var x =C2=AB<-chan =C2=BBi=
nt"},
> ++      {name: "interface", format: "package main; var x =C2=ABinterface =
{ M() =C2=ABint=C2=BB }=C2=BB", scope: true, scopeMultiplier: 2}, // Scopes=
: InterfaceType, FuncType
> ++      {name: "map", format: "package main; var x =C2=ABmap[int]=C2=BBin=
t"},
> ++      {name: "slicelit", format: "package main; var x =3D =C2=AB[]any{=
=C2=AB=C2=BB}=C2=BB", parseMultiplier: 2},             // Parser nodes: Una=
ryExpr, CompositeLit
> ++      {name: "arraylit", format: "package main; var x =3D =C2=AB[1]any{=
=C2=ABnil=C2=BB}=C2=BB", parseMultiplier: 2},         // Parser nodes: Unar=
yExpr, CompositeLit
> ++      {name: "structlit", format: "package main; var x =3D =C2=ABstruct=
{x any}{=C2=ABnil=C2=BB}=C2=BB", parseMultiplier: 2}, // Parser nodes: Unar=
yExpr, CompositeLit
> ++      {name: "maplit", format: "package main; var x =3D =C2=ABmap[int]a=
ny{1:=C2=ABnil=C2=BB}=C2=BB", parseMultiplier: 2},    // Parser nodes: Comp=
ositeLit, KeyValueExpr
> ++      {name: "dot", format: "package main; var x =3D =C2=ABx.=C2=BBx"},
> ++      {name: "index", format: "package main; var x =3D x=C2=AB[1]=C2=BB=
"},
> ++      {name: "slice", format: "package main; var x =3D x=C2=AB[1:2]=C2=
=BB"},
> ++      {name: "slice3", format: "package main; var x =3D x=C2=AB[1:2:3]=
=C2=BB"},
> ++      {name: "dottype", format: "package main; var x =3D x=C2=AB.(any)=
=C2=BB"},
> ++      {name: "callseq", format: "package main; var x =3D x=C2=AB()=C2=
=BB"},
> ++      {name: "methseq", format: "package main; var x =3D x=C2=AB.m()=C2=
=BB", parseMultiplier: 2}, // Parser nodes: SelectorExpr, CallExpr
> ++      {name: "binary", format: "package main; var x =3D =C2=AB1+=C2=BB1=
"},
> ++      {name: "binaryparen", format: "package main; var x =3D =C2=AB1+(=
=C2=AB1=C2=BB)=C2=BB", parseMultiplier: 2}, // Parser nodes: BinaryExpr, Pa=
renExpr
> ++      {name: "unary", format: "package main; var x =3D =C2=AB^=C2=BB1"}=
,
> ++      {name: "addr", format: "package main; var x =3D =C2=AB& =C2=BBx"}=
,
> ++      {name: "star", format: "package main; var x =3D =C2=AB*=C2=BBx"},
> ++      {name: "recv", format: "package main; var x =3D =C2=AB<-=C2=BBx"}=
,
> ++      {name: "call", format: "package main; var x =3D =C2=ABf(=C2=AB1=
=C2=BB)=C2=BB", parseMultiplier: 2},    // Parser nodes: Ident, CallExpr
> ++      {name: "conv", format: "package main; var x =3D =C2=AB(*T)(=C2=AB=
1=C2=BB)=C2=BB", parseMultiplier: 2}, // Parser nodes: ParenExpr, CallExpr
> ++      {name: "label", format: "package main; func main() { =C2=ABLabel:=
=C2=BB }"},
> ++      {name: "if", format: "package main; func main() { =C2=ABif true {=
 =C2=AB=C2=BB }=C2=BB}", parseMultiplier: 2, scope: true, scopeMultiplier: =
2}, // Parser nodes: IfStmt, BlockStmt. Scopes: IfStmt, BlockStmt
> ++      {name: "ifelse", format: "package main; func main() { =C2=ABif tr=
ue {} else =C2=BB {} }", scope: true},
> ++      {name: "switch", format: "package main; func main() { =C2=ABswitc=
h { default: =C2=AB=C2=BB }=C2=BB}", scope: true, scopeMultiplier: 2},     =
          // Scopes: TypeSwitchStmt, CaseClause
> ++      {name: "typeswitch", format: "package main; func main() { =C2=ABs=
witch x.(type) { default: =C2=AB=C2=BB }=C2=BB }", scope: true, scopeMultip=
lier: 2}, // Scopes: TypeSwitchStmt, CaseClause
> ++      {name: "for0", format: "package main; func main() { =C2=ABfor { =
=C2=AB=C2=BB }=C2=BB }", scope: true, scopeMultiplier: 2},                 =
           // Scopes: ForStmt, BlockStmt
> ++      {name: "for1", format: "package main; func main() { =C2=ABfor x {=
 =C2=AB=C2=BB }=C2=BB }", scope: true, scopeMultiplier: 2},                =
          // Scopes: ForStmt, BlockStmt
> ++      {name: "for3", format: "package main; func main() { =C2=ABfor f()=
; g(); h() { =C2=AB=C2=BB }=C2=BB }", scope: true, scopeMultiplier: 2},    =
          // Scopes: ForStmt, BlockStmt
> ++      {name: "forrange0", format: "package main; func main() { =C2=ABfo=
r range x { =C2=AB=C2=BB }=C2=BB }", scope: true, scopeMultiplier: 2},     =
          // Scopes: RangeStmt, BlockStmt
> ++      {name: "forrange1", format: "package main; func main() { =C2=ABfo=
r x =3D range z { =C2=AB=C2=BB }=C2=BB }", scope: true, scopeMultiplier: 2}=
,           // Scopes: RangeStmt, BlockStmt
> ++      {name: "forrange2", format: "package main; func main() { =C2=ABfo=
r x, y =3D range z { =C2=AB=C2=BB }=C2=BB }", scope: true, scopeMultiplier:=
 2},        // Scopes: RangeStmt, BlockStmt
> ++      {name: "go", format: "package main; func main() { =C2=ABgo func()=
 { =C2=AB=C2=BB }()=C2=BB }", parseMultiplier: 2, scope: true},            =
          // Parser nodes: GoStmt, FuncLit
> ++      {name: "defer", format: "package main; func main() { =C2=ABdefer =
func() { =C2=AB=C2=BB }()=C2=BB }", parseMultiplier: 2, scope: true},      =
          // Parser nodes: DeferStmt, FuncLit
> ++      {name: "select", format: "package main; func main() { =C2=ABselec=
t { default: =C2=AB=C2=BB }=C2=BB }", scope: true},
> ++}
> ++
> ++// split splits pre=C2=ABmid=C2=BBpost into pre, mid, post.
> ++// If the string does not have that form, split returns x, "", "".
> ++func split(x string) (pre, mid, post string) {
> ++      start, end :=3D strings.Index(x, "=C2=AB"), strings.LastIndex(x, =
"=C2=BB")
> ++      if start < 0 || end < 0 {
> ++              return x, "", ""
> ++      }
> ++      return x[:start], x[start+len("=C2=AB") : end], x[end+len("=C2=BB=
"):]
> ++}
> ++
> ++func TestParseDepthLimit(t *testing.T) {
> ++      if runtime.GOARCH =3D=3D "wasm" {
> ++              t.Skip("causes call stack exhaustion on js/wasm")
> ++      }
> ++      for _, tt :=3D range parseDepthTests {
> ++              for _, size :=3D range []string{"small", "big"} {
> ++                      t.Run(tt.name+"/"+size, func(t *testing.T) {
> ++                              n :=3D maxNestLev + 1
> ++                              if tt.parseMultiplier > 0 {
> ++                                      n /=3D tt.parseMultiplier
> ++                              }
> ++                              if size =3D=3D "small" {
> ++                                      // Decrease the number of stateme=
nts by 10, in order to check
> ++                                      // that we do not fail when under=
 the limit. 10 is used to
> ++                                      // provide some wiggle room for c=
ases where the surrounding
> ++                                      // scaffolding syntax adds some n=
oise to the depth that changes
> ++                                      // on a per testcase basis.
> ++                                      n -=3D 10
> ++                              }
> ++
> ++                              pre, mid, post :=3D split(tt.format)
> ++                              if strings.Contains(mid, "=C2=AB") {
> ++                                      left, base, right :=3D split(mid)
> ++                                      mid =3D strings.Repeat(left, n) +=
 base + strings.Repeat(right, n)
> ++                              } else {
> ++                                      mid =3D strings.Repeat(mid, n)
> ++                              }
> ++                              input :=3D pre + mid + post
> ++
> ++                              fset :=3D token.NewFileSet()
> ++                              _, err :=3D ParseFile(fset, "", input, Pa=
rseComments|SkipObjectResolution)
> ++                              if size =3D=3D "small" {
> ++                                      if err !=3D nil {
> ++                                              t.Errorf("ParseFile(...):=
 %v (want success)", err)
> ++                                      }
> ++                              } else {
> ++                                      expected :=3D "exceeded max nesti=
ng depth"
> ++                                      if err =3D=3D nil || !strings.Has=
Suffix(err.Error(), expected) {
> ++                                              t.Errorf("ParseFile(...) =
=3D _, %v, want %q", err, expected)
> ++                                      }
> ++                              }
> ++                      })
> ++              }
> ++      }
> ++}
> ++
> ++func TestScopeDepthLimit(t *testing.T) {
> ++      if runtime.GOARCH =3D=3D "wasm" {
> ++              t.Skip("causes call stack exhaustion on js/wasm")
> ++      }
> ++      for _, tt :=3D range parseDepthTests {
> ++              if !tt.scope {
> ++                      continue
> ++              }
> ++              for _, size :=3D range []string{"small", "big"} {
> ++                      t.Run(tt.name+"/"+size, func(t *testing.T) {
> ++                              n :=3D maxScopeDepth + 1
> ++                              if tt.scopeMultiplier > 0 {
> ++                                      n /=3D tt.scopeMultiplier
> ++                              }
> ++                              if size =3D=3D "small" {
> ++                                      // Decrease the number of stateme=
nts by 10, in order to check
> ++                                      // that we do not fail when under=
 the limit. 10 is used to
> ++                                      // provide some wiggle room for c=
ases where the surrounding
> ++                                      // scaffolding syntax adds some n=
oise to the depth that changes
> ++                                      // on a per testcase basis.
> ++                                      n -=3D 10
> ++                              }
> ++
> ++                              pre, mid, post :=3D split(tt.format)
> ++                              if strings.Contains(mid, "=C2=AB") {
> ++                                      left, base, right :=3D split(mid)
> ++                                      mid =3D strings.Repeat(left, n) +=
 base + strings.Repeat(right, n)
> ++                              } else {
> ++                                      mid =3D strings.Repeat(mid, n)
> ++                              }
> ++                              input :=3D pre + mid + post
> ++
> ++                              fset :=3D token.NewFileSet()
> ++                              _, err :=3D ParseFile(fset, "", input, De=
clarationErrors)
> ++                              if size =3D=3D "small" {
> ++                                      if err !=3D nil {
> ++                                              t.Errorf("ParseFile(...):=
 %v (want success)", err)
> ++                                      }
> ++                              } else {
> ++                                      expected :=3D "exceeded max scope=
 depth during object resolution"
> ++                                      if err =3D=3D nil || !strings.Has=
Suffix(err.Error(), expected) {
> ++                                              t.Errorf("ParseFile(...) =
=3D _, %v, want %q", err, expected)
> ++                                      }
> ++                              }
> ++                      })
> ++              }
> ++      }
> ++}
> +diff --git a/src/go/parser/resolver.go b/src/go/parser/resolver.go
> +index cf92c7e4f5..f55bdb7f17 100644
> +--- a/src/go/parser/resolver.go
> ++++ b/src/go/parser/resolver.go
> +@@ -25,6 +25,7 @@ func resolveFile(file *ast.File, handle *token.File, d=
eclErr func(token.Pos, str
> +               declErr:  declErr,
> +               topScope: pkgScope,
> +               pkgScope: pkgScope,
> ++              depth:    1,
> +       }
> +
> +       for _, decl :=3D range file.Decls {
> +@@ -53,6 +54,8 @@ func resolveFile(file *ast.File, handle *token.File, d=
eclErr func(token.Pos, str
> +       file.Unresolved =3D r.unresolved[0:i]
> + }
> +
> ++const maxScopeDepth int =3D 1e3
> ++
> + type resolver struct {
> +       handle  *token.File
> +       declErr func(token.Pos, string)
> +@@ -61,6 +64,7 @@ type resolver struct {
> +       pkgScope   *ast.Scope   // pkgScope.Outer =3D=3D nil
> +       topScope   *ast.Scope   // top-most scope; may be pkgScope
> +       unresolved []*ast.Ident // unresolved identifiers
> ++      depth      int          // scope depth
> +
> +       // Label scopes
> +       // (maintained by open/close LabelScope)
> +@@ -83,6 +87,10 @@ func (r *resolver) sprintf(format string, args ...int=
erface{}) string {
> + }
> +
> + func (r *resolver) openScope(pos token.Pos) {
> ++      r.depth++
> ++      if r.depth > maxScopeDepth {
> ++              panic(bailout{pos: pos, msg: "exceeded max scope depth du=
ring object resolution"})
> ++      }
> +       if debugResolve {
> +               r.dump("opening scope @%v", pos)
> +       }
> +@@ -90,6 +98,7 @@ func (r *resolver) openScope(pos token.Pos) {
> + }
> +
> + func (r *resolver) closeScope() {
> ++      r.depth--
> +       if debugResolve {
> +               r.dump("closing scope")
> +       }
> +--
> +2.30.2
> +
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174921): https://lists.openembedded.org/g/openembedde=
d-core/message/174921
> Mute This Topic: https://lists.openembedded.org/mt/95809427/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

