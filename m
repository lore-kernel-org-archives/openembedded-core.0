Subject: Re: Application depending on gRPC not linking properly
To: openembedded-core@lists.openembedded.org
From: "Goran Broeckaert" <broeckaert.goran@gmail.com>
X-Originating-Location: Wijnegem, Flanders, BE (81.246.50.154)
X-Originating-Platform: Windows Chrome 85
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 11 Sep 2020 01:10:19 -0700
References: <b50e6ff8-5fb9-e654-f895-7e6a494f564b@gmail.com>
In-Reply-To: <b50e6ff8-5fb9-e654-f895-7e6a494f564b@gmail.com>
Message-ID: <22857.1599811819676608572@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="tGdw7t86vn375tRqRkgh"

--tGdw7t86vn375tRqRkgh
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I have been able to fix it by searching for the right grpc libraries in the=
 recipe-sysroot:

find_library(GRPC_LIBRARY grpc++
HINTS
${CMAKE_SOURCE_DIR}/recipe- sysroot)

if (GRPC_LIBRARY-NOTFOUND)
message(FATAL_ERROR "Could not find grpc++")
endif ()

find_path(GRPC_INCLUDE_DIR grpc++/grpc++.h
HINTS
${CMAKE_SOURCE_DIR}/recipe- sysroot)

add_library(gRPC::grpc++ UNKNOWN IMPORTED)
set_target_properties(gRPC:: grpc++
PROPERTIES INTERFACE_INCLUDE_DIRECTORIES
"${GRPC_INCLUDE_DIR}")
set_target_properties(gRPC:: grpc++
PROPERTIES IMPORTED_LOCATION
"${GRPC_LIBRARY}")
set(GRPC_LIBRARIES gRPC::grpc++)

and then at the end add to link the found grpc library to your application=
:

target_link_libraries(${ PROJECT_NAME}
PRIVATE protobuf::libprotobuf
PRIVATE ${GRPC_LIBRARIES}
)

I haven't changed anything to my recipe, just that I added an environment =
setting which gets set as "YOCTO" to only execute this when it's being ran =
by Yocto. Can do less hard coding (setting the hint as ${CMAKE_SOURCE_DIR}/=
recipe- sysroot) by looking in CMAKE_SYSROOT.

This doesn't seem like an easy patch to add to gRPC. And since the issue, =
which I linked in my first post, got already closed without providing a rea=
l solution; it seems like the people at gRPC aren't really sure what is hap=
pening either.

Kind regards,
Goran Broeckaert

--tGdw7t86vn375tRqRkgh
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">I have been able to fix it by searching for the right grp=
c libraries in the recipe-sysroot:</span><br style=3D"color: #222222; font-=
family: Arial, Helvetica, sans-serif; font-size: small;" /><br style=3D"col=
or: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small;" =
/>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">find_library(GRPC_LIBRARY grpc++</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;HINTS</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;${CMAKE_SOURCE_DIR}/recipe-<wbr />sysroot)</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">if (GRPC_LIBRARY-NOTFOUND)</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp; &nbsp; &nbsp; &nbsp; message(FATAL_ERROR "Could no=
t find grpc++")</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">endif ()</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">find_path(GRPC_INCLUDE_DIR grpc++/grpc++.h</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; HINTS</d=
iv>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${CMAKE_=
SOURCE_DIR}/recipe-<wbr />sysroot)</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp;</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">add_library(gRPC::grpc++ UNKNOWN IMPORTED)</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">set_target_properties(gRPC::<wbr />grpc++</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; PROPERTIES INTERFACE_INCLUDE_DIRECTORIES<=
/div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "${GRPC_INCLUDE_DIR}")</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">set_target_properties(gRPC::<wbr />grpc++</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; PROPERTIES IMPORTED_LOCATION</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "${GRPC_LIBRARY}")</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">set(GRPC_LIBRARIES gRPC::grpc++)<br /><br />and then at t=
he end add to link the found grpc library to your application:<br /><br />
<div>target_link_libraries(${<wbr />PROJECT_NAME}</div>
<div>&nbsp; &nbsp; PRIVATE protobuf::libprotobuf</div>
<div>&nbsp; &nbsp; PRIVATE ${GRPC_LIBRARIES}</div>
<div>)</div>
</div>
<div style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;"><br />I haven't changed anything to my recipe, just that =
I added an environment setting which gets set as "YOCTO" to only execute th=
is when it's being ran by Yocto. Can do less hard coding (setting the hint =
as ${CMAKE_SOURCE_DIR}/recipe-<wbr />sysroot) by looking in CMAKE_SYSROOT.<=
br /><br />This doesn't seem like an easy patch to add to gRPC. And since t=
he issue, which I linked in my first post, got already closed without provi=
ding a real solution; it seems like the people at gRPC aren't really sure w=
hat is happening either.<br /><br />Kind regards,<br />Goran Broeckaert</di=
v>

--tGdw7t86vn375tRqRkgh--
