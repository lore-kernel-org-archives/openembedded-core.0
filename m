Return-Path: <jurobystricky@hotmail.com>
Received: from BAY004-OMC3S15.hotmail.com (bay004-omc3s15.hotmail.com
	[65.54.190.153])
	by mail.openembedded.org (Postfix) with ESMTP id 4EE6072184
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Nov 2014 20:25:56 +0000 (UTC)
Received: from BAY179-W23 ([65.54.190.189]) by BAY004-OMC3S15.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751); 
	Sat, 22 Nov 2014 12:25:57 -0800
X-TMN: [GSCOufrZfz/l0GzbVXNGWw/Io/IzjCjL]
X-Originating-Email: [jurobystricky@hotmail.com]
Message-ID: <BAY179-W23BA95928DB2725F7F151FBB740@phx.gbl>
From: Juro Bystricky <jurobystricky@hotmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sat, 22 Nov 2014 12:25:56 -0800
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Nov 2014 20:25:57.0303 (UTC)
	FILETIME=[85C53470:01D00692]
Subject: glibc: Inconsistencies in pre-processing of option-groups.h
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
X-List-Received-Date: Sat, 22 Nov 2014 20:26:03 -0000
Content-Type: multipart/alternative;
	boundary="_1bcc31ed-0da1-4f0d-bc28-91fb65cd7c00_"

--_1bcc31ed-0da1-4f0d-bc28-91fb65cd7c00_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

There are some inconsistencies when processing eglibc options.
"option-groups.h" is generated automatically=2C and to quote:

"It defines macros that indicate which EGLIBC option groups were
   configured in 'option-groups.config' when this C library was
   built.  For each option group named OPTION_foo=2C it #defines
   __OPTION_foo to be 1 if the group is enabled=2C or leaves that
   symbol undefined if the group is disabled."

So for example=2C one of the following may be generared:

#define __OPTION_XXX  1

or=20

/* undef __OPTION_XXX */

However=2C the glibc headers are preprocessed inconsistently=2C sometimes u=
sing:

#ifdef __OPTION_XXX
...

and sometimes

#if __OPTION_XXX
...

The latter case will result in many compiler warning for options that are n=
ot defined.
This is quite evident when building poky-tiny=2C where many options are dis=
abled.
(This warning will be treated as errors in future releases of glibc.)

To fix these inconsistencies=2C there are two solutions:

One solution would be to generate

#define __OPTION_XXX 0

instead of=20

/* undef __OPTION_XXX */

In this case all preprocessing tests can use/should use=20

#if __OPTION_XXX
...

Second solution would be to leave generation of option-groups.h as it is=2C=
=20
but in this case all occurrences of=20

#if __OPTION_XXX

should be consistently replaced everywhere by=20

#ifdef __OPTION_XXX

Juro
 		 	   		  =

--_1bcc31ed-0da1-4f0d-bc28-91fb65cd7c00_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style><!--
.hmmessage P
{
margin:0px=3B
padding:0px
}
body.hmmessage
{
font-size: 12pt=3B
font-family:Calibri
}
--></style></head>
<body class=3D'hmmessage'><div dir=3D'ltr'>There are some inconsistencies w=
hen processing eglibc options.<br>"option-groups.h" is generated automatica=
lly=2C and to quote:<br><br>"It defines macros that indicate which EGLIBC o=
ption groups were<br>&nbsp=3B&nbsp=3B configured in 'option-groups.config' =
when this C library was<br>&nbsp=3B&nbsp=3B built.&nbsp=3B For each option =
group named OPTION_foo=2C it #defines<br>&nbsp=3B&nbsp=3B __OPTION_foo to b=
e 1 if the group is enabled=2C or leaves that<br>&nbsp=3B&nbsp=3B symbol un=
defined if the group is disabled."<br><br>So for example=2C one of the foll=
owing may be generared:<br><br>#define __OPTION_XXX&nbsp=3B 1<br><br>or <br=
><br>/* undef __OPTION_XXX */<br><br>However=2C the glibc headers are prepr=
ocessed inconsistently=2C sometimes using:<br><br>#ifdef __OPTION_XXX<br>..=
.<br><br>and sometimes<br><br>#if __OPTION_XXX<br>...<br><br>The latter cas=
e will result in many compiler warning for options that are not defined.<br=
>This is quite evident when building poky-tiny=2C where many options are di=
sabled.<br>(This warning will be treated as errors in future releases of gl=
ibc.)<br><br>To fix these inconsistencies=2C there are two solutions:<br><b=
r>One solution would be to generate<br><br>#define __OPTION_XXX 0<br><br>in=
stead of <br><br>/* undef __OPTION_XXX */<br><br>In this case all preproces=
sing tests can use/should use <br><br>#if __OPTION_XXX<br>...<br><br>Second=
 solution would be to leave generation of option-groups.h as it is=2C <br>b=
ut in this case all occurrences of <br><br>#if __OPTION_XXX<br><br>should b=
e consistently replaced everywhere by <br><br>#ifdef __OPTION_XXX<br><br>Ju=
ro<br> 		 	   		  </div></body>
</html>=

--_1bcc31ed-0da1-4f0d-bc28-91fb65cd7c00_--
