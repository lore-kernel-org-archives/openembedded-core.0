Received: from smtp24.4emm.com ([69.18.222.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1R3JI8-00067W-4p
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 05:04:08 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB24.4emm.local ([::1]) with mapi id 14.01.0289.001; Mon, 12 Sep 2011
	22:58:58 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Problem with new image-prelink
Thread-Index: Acxumoq/2ilmZmWnTuuyv8ZWELunbgAkC2oAAHA4PNAAJEvugAAQ8DpQ
Date: Tue, 13 Sep 2011 02:58:57 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF18E950@MBX20.4emm.local>
References: <840A81C1B782724A8EB52725BD519EFF18E621@MBX20.4emm.local>
	<4E6A3770.4060307@windriver.com>
	<840A81C1B782724A8EB52725BD519EFF18E85D@MBX20.4emm.local>
	<4E6E1C1D.7010500@windriver.com>
In-Reply-To: <4E6E1C1D.7010500@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Re: Problem with new image-prelink
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
X-List-Received-Date: Tue, 13 Sep 2011 03:04:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Mark Hatle
> Sent: Monday, 12 September 2011 10:50 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] Problem with new image-prelink
>=20
> Once the Linux Foundation servers come back on-line, I'll file a bug in t=
he
> bugzilla.yoctoproject.org bug tracker.
>=20
> Hopefully this is something fairly simple, and fixing the target prelink-=
rtld
> will also resolve the failed prelinking for the QT binary.
>=20
> I hope to get to investigating this tomorrow.  If you have time, you shou=
ld be
> able to capture a core, or use gdb on the target and figure out where the=
 bad
> alignment trap is occurring.
>=20
> The failure is in the "prelink-rtld" binary.  Most likely when it's being=
 run using:
>=20
> RTLD_WARN=3D RTLD_TRACE_PRELINKING=3D1 prelink-rtld <binary>
>=20
> That should fail with the same unaligned access..
>=20
> Once that works and no longer fails.... it should produce the same output=
 as if
> you ran:
>=20
> LD_WARN=3D LD_TRACE_LOADED_OBJECTS=3D1 LD_TRACE_PRELINKING=3D1
> LD_BIND_NOW=3D1
> /lib/ld-linux.so.3 <binary>
>=20
> (/lib/ld-linux.so.3 is from memory so I may be wrong..)  Any deviation be=
tween
> the two could point to an alternative cause to the QT failure as well.
>=20
> --Mark

Thanks Mark. Here is a backtrace of the alignment trap, after enabling SIGB=
US when faulting:

root@192:~# gdb prelink
<...>
Reading symbols from /usr/sbin/prelink...Reading symbols from /usr/sbin/.de=
bug/prelink...done.
done.
(gdb) set follow-fork-mode child
(gdb) run -a
Starting program: /usr/sbin/prelink -a
[New process 1712]
process 1712 is executing new program: /usr/sbin/prelink-rtld
[ 2777.370000] Alignment trap: prelink-rtld (1712) PC=3D0x410f9990 Instr=3D=
0xe5922024 Address=3D0x00000025 FSR 0x001

Program received signal SIGBUS, Bus error.
[Switching to process 1712]
0x410f9990 in __ctype_b_loc () at ../include/ctype.h:30
30          *tablep =3D (const uint16_t *) _NL_CURRENT (LC_CTYPE, _NL_CTYPE=
_CLASS) + 128;
(gdb) bt
#0  0x410f9990 in __ctype_b_loc () at ../include/ctype.h:30
#1  __option_is_short (__opt=3D<optimized out>) at argp.h:579
#2  convert_options (argp=3D0x0, parent=3D0x0, parent_index=3D121872,
    group=3D<optimized out>, cvt=3D0xbebd1b98) at argp-parse.c:335
#3  0x410f9938 in convert_options (argp=3D0x4114f210, parent=3D0x0,
    parent_index=3D3200064088, group=3D<optimized out>, cvt=3D0xbebd1b98)
    at argp-parse.c:406
#4  0x410f9c80 in parser_convert (flags=3D0, argp=3D0xbebd1a58, parser=3D0x=
bebd1ae0)
    at argp-parse.c:435
#5  parser_init (input=3D0x0, flags=3D0, argv=3D0xbebd1e74, argc=3D3,
    argp=3D<optimized out>, parser=3D0xbebd1ae0) at argp-parse.c:515
#6  __argp_parse (argp=3D<optimized out>, argc=3D3, argv=3D0xbebd1e74, flag=
s=3D0,
    end_index=3D0xbebd1cfc, input=3D0x0) at argp-parse.c:915
#7  0x00009784 in main (argc=3D1090670408, argv=3D0x0) at rtld.c:895
(gdb)

I've never used argp before, but I couldn't find anything wrong with rtld.c=
 ...

Regards,
James



